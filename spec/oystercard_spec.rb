
require './lib/oystercard.rb'

describe Oystercard do

  it 'Sets new card to have a default balance of 0' do
    expect(subject.balance).to eq 0
  end

  describe "#top_up" do
    it 'Adds money to card' do
      expect { subject.top_up(1) }.to change { subject.balance }.by(1)
    end

    it { is_expected.to respond_to { :top_up }.with(1).argument }

    it 'Does not allow @balance to be over 90' do
      card = Oystercard.new 90
      expect { card.top_up(1) }.to raise_error 'Oystercard has reached the limit'
    end
  end

  describe "#in_journey?" do
    it "Journey status should be false by default" do
      expect(subject.in_journey).to eq false
    end
  end

  describe '#touch_in' do

    it "Updates @in_journey to be true" do
      subject.top_up(2)
      subject.touch_in("Kings Cross")
      expect(subject.in_journey).to eq true
    end

    it "@balance must be at least 1 to touch_in" do
      expect { subject.touch_in("Kings Cross") }.to raise_error "Sorry insufficient funds available"
    end

    it "Updates @entry_station when touching in " do
      subject.top_up(2)
      subject.touch_in("Kings Cross")
      expect(subject.entry_station).to eq "Kings Cross"
    end

  end

  describe '#touch_out' do
    let(:topped_up_card) do
      subject.top_up(2)
      subject.touch_in("Kings Cross")
    end

    it "Updates @in_journey to be false" do
      topped_up_card
      subject.touch_out("Aldgate East")
      expect(subject.in_journey).to eq false
    end

    it "Deducts MINIMUM_FARE from @balance" do
      topped_up_card
      expect { subject.touch_out("Aldgate East") }.to change { subject.balance }.from(2).to(1)
    end

    it "Updates @exit_station when touching out" do
      topped_up_card
      subject.touch_out("Aldgate East")
      expect(subject.exit_station).to eq "Aldgate East"
    end

    it "Resets @entry_station to nil" do
      topped_up_card
      subject.touch_in("Kings Cross")
      subject.touch_out("Aldgate East")
      expect(subject.entry_station).to eq nil
    end
  end

  describe '#journey_history' do
    it "Checks that the list of journeys is empty by default" do
      expect(subject.journey_history).to eq []
    end
    it "Touching in and out should create one journey" do
      subject.top_up(2)
      subject.touch_in("Kings Cross")
      subject.touch_out("Aldgate East")
      expect(subject.journey_history).to eq ["Kings Cross" => "Aldgate East"]
    end
  end
end

require 'oystercard'
require 'journey'
require 'journey_log'

describe Oystercard do

  let(:entry_station) { double('Aldgate', zone: 1) }
  let(:exit_station) { double('Finchley', zone: 4) }
  let(:touched_in_card) do
    subject.top_up(50)
    subject.touch_in(entry_station)
  end

  it 'Sets new card to have a default balance of 0' do
    expect(subject.balance).to eq 0
  end

  describe "#top_up" do
    it { is_expected.to respond_to { :top_up }.with(1).argument }

    it 'Adds money to card' do
      expect { subject.top_up(1) }.to change { subject.balance }.by(1)
    end

    it 'Does not allow @balance to be over 90' do
      card = Oystercard.new 50
      expect { card.top_up(50) }.to raise_error 'Oystercard has reached the limit'
    end

  end

  describe '#touch_in' do
    it "@balance must be at least 1 to touch_in" do
      expect { subject.touch_in(entry_station) }.to raise_error "Sorry insufficient funds available"
    end
  end

  describe '#touch_out' do
    it "Deducts @journey.fare from @balance" do
      subject.top_up(50)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.balance).to eq 46
    end
  end
end

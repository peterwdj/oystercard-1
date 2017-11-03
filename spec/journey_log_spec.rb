require 'journey_log'

describe JourneyLog do
  describe '#begin_journey' do
    it "Should begin a journey" do
      expect(subject.begin_journey("Aldgate")). to eq true
    end
  end

  describe '#journey_history' do
    it "Checks that the list of journeys is empty by default" do
      expect(subject.journey_history).to eq []
    end
    it "Touching in and out should create one journey" do
      subject.begin_journey("Kings Cross")
      subject.finish_journey("Aldgate East")
      expect(subject.journey_history).to eq [{ entry_station: "Kings Cross", exit_station: "Aldgate East" }]
    end
  end

  describe '#finish_journey' do
    it "Should update @in_journey to be false" do
      subject.begin_journey("Kings Cross")
      expect(subject.finish_journey("Aldgate East")).to eq false
    end
  end

  describe '#reset_journey' do
    it "Resets @entry_station to nil" do
      subject.begin_journey("Kings Cross")
      subject.finish_journey("Aldgate East")
      expect(subject.entry_station).to eq nil
    end
  end
end

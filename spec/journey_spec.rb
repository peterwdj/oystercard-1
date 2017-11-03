require 'journey'

describe Journey do
  let(:entry_station) { double(:Aldgate) }
  let(:exit_station) { double(:Finchley) }

  describe '#current_journey' do
    context 'when checking whole journey' do
      it 'should return complete single journey' do
        subject.current_journey(entry_station, exit_station)
        expect(subject.journey).to eq [{ entry_station => exit_station }]
      end
      it "Should return an empty journey when initialised" do
        expect(subject.journey).to eq []
      end
    end
  end

  describe '#fare' do
    it "Should deduct a fare of £4 for a trip from Zone 1 to Zone 4" do
      allow(entry_station).to receive(:zone) { 1 }
      allow(exit_station).to receive(:zone) { 4 }
      subject.start_journey(entry_station)
      subject.end_journey(exit_station)
      expect(subject.fare).to eq 4
    end

    it "Should deduct a fare of £4 for a trip from Zone 3 to Zone 3" do
      allow(entry_station).to receive(:zone) { 3 }
      allow(exit_station).to receive(:zone) { 3 }
      subject.start_journey(entry_station)
      subject.end_journey(exit_station)
      expect(subject.fare).to eq 1
    end

    it "Should deduct a fare of £4 for a trip from Zone 5 to Zone 1" do
      allow(entry_station).to receive(:zone) { 5 }
      allow(exit_station).to receive(:zone) { 1 }
      subject.start_journey(entry_station)
      subject.end_journey(exit_station)
      expect(subject.fare).to eq 5
    end
  end
end

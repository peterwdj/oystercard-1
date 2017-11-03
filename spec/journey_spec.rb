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
    it "Should deduct a fare of £3 for a trip from Zone 1 to Zone 3" do

    end
  end
end

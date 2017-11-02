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
    end
  end
end

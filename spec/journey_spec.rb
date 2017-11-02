require 'journey'

describe Journey do
  describe '#current_journey' do
    context 'When adding a journey' do
      it 'Should return entry_station' do
        expect(subject.current_journey("Aldgate")).to eq subject.entry
      end
    end
  end
end

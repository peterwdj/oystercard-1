require 'journey'

describe Journey do
  let(:entry_station) { double(:Aldgate) }
  let(:exit_station) { double(:Finchley) }

  describe '#start_journey' do
    context 'When adding a journey' do
      it 'Should return entry_station' do
        expect(subject.start_journey(entry_station)).to eq subject.entry_station
      end
    end
  end


  describe '#end_journey' do
    context 'When adding a journey' do
      it 'should return exit station' do
        expect(subject.end_journey(exit_station)).to eq subject.exit_station
      end
    end
  end

  describe '#current_journey' do
    context 'when checking whole journey' do
      it 'should return complete single journey' do
        subject.start_journey(entry_station)
        subject.end_journey(exit_station)
        expect(subject.current_journey). to eq {entry_station => exit_station}
      end
    end
  end
end

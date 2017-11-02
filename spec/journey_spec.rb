require 'journey'

describe Journey do
  subject(:card)
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
  #
  # describe '#penalty_fare' do
  #   context 'Charging a penalty fare when touching in twice in a row' do
  #     it "Should charge a £6 penalty fare" do
  #       allow
  #     end
  #   end
  # end
end

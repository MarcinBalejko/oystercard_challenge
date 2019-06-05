require './lib/journey.rb'
describe Journey do

    let(:entry_station) { Station.new("Entry", 1) }
    let(:exit_station) { Station.new("Exit", 2) }

    describe '#in_journey?' do
        it 'initially not in journey' do
            expect(subject).not_to be_in_journey
        end
    end

    describe '#start' do
        it 'can be started' do
            expect(subject).to respond_to(:start)    
        end
    end

    context 'when journey started' do
        before do
            subject.start(entry_station)
        end

        it 'stores the entry station' do
            expect(subject.current_journeys[0]).to eq entry_station
        end

        it 'stores exit station' do
            subject.finish(exit_station)
            expect(subject.list_of_journeys.keys[-1][-1]).to eq(exit_station)
        end

        it 'has an empty list of journeys by default' do
            expect(subject.list_of_journeys).to be_empty
        end

        describe '#complete?' do
            it 'returns false if the journey is not complete' do
                expect(subject.complete?).to eq(false)
            end
        end

        describe '#calculate_fare' do
            it 'calculates the fare according to the zones' do
                expect(subject.calculate_fare(exit_station)).to eq(2)         
            end
        end
    end

end
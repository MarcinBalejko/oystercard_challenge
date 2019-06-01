require './lib/journey.rb'
describe Journey do

    let(:entry_station) { Station.new("Entry", 1) }
    let(:exit_station) { Station.new("Exit", 1) }

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

    it 'stores the entry station' do
        subject.start(entry_station)
        expect(subject.current_journeys[0]).to eq entry_station
    end

    it 'stores exit station' do
        subject.start(entry_station)
        subject.finish(exit_station)
        expect(subject.list_of_journeys.keys[-1][-1]).to eq(exit_station)
    end

    it 'has an empty list of journeys by default' do
        expect(subject.list_of_journeys).to be_empty
    end  
    
end
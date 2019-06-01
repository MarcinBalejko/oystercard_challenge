require './lib/journey.rb'
describe Journey do

    describe '#in_journey?' do
        it 'initially not in journey' do
            expect(subject).not_to be_in_journey
        end
    end

    describe '#start' do
        it 'can be started' do
            station = Station.new("The station", 1)
            subject.start(station)
            expect(subject.current_journeys[0]).to eq(station)
        end
    end
    
end
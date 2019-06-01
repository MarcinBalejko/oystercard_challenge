require './lib/journey.rb'
describe Journey do

    let(:station) {Station.new("The station", 1)}

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

        subject.start(station)
        expect(subject.current_journeys[0]).to eq station
    end
    
end
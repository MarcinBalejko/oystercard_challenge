require './lib/journey.rb'
describe Journey do

    describe '#in_journey?' do
        it 'initially not in journey' do
            expect(subject).not_to be_in_journey
        end
    end

    describe '#touch_in' do        #tu zmienic duzo
        it 'can touch in' do
            subject.top_up Oystercard::MINIMUM_BALANCE
            subject.touch_in(station)
            expect(subject).to be_in_journey
        end
    end
    
end
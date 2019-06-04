require './lib/oystercard.rb'
describe Oystercard do
    let(:station) { Station.new("The station", 1) }

    it 'balance equals 0' do
        expect(subject.balance).to eq(0)
    end

    describe '#top_up' do
        it 'can top up the balance' do
            expect{ subject.top_up 1}.to change{ subject.balance }.by 1
        end 
    end

    describe '#touch_in' do
        it 'can touch in' do
            subject.top_up Oystercard::MINIMUM_BALANCE
            subject.touch_in(station)
            expect(subject.journey.current_journeys[0]).to eq(station)
        end
    end

    #be in journey
   
    describe '#minimum_balance' do 
        it 'raises an error if the balance is below minimum' do
            expect{ subject.touch_in(station) }.to raise_error 'Insufficient balance to touch in'
        end
    end

    context 'when touched in' do
        before do
          subject.top_up Oystercard::MAXIMUM_BALANCE
          subject.touch_in(station)
        end

    let(:entry_station) { Station.new("Entry", 1)}
    let(:exit_station) { Station.new("Exit", 1) }

        it 'can touch out' do         
            subject.touch_in(entry_station)
            expect(subject).to respond_to(:touch_out)
        end   

        describe '#deduct' do
            it 'deducts amount from the card with minimum charge' do   
                expect { subject.touch_out(station) }.to change{ subject.balance }.by(-Oystercard::MINIMUM_CHARGE)
            end
        end
    end
    
    describe '#maximum_balance' do
        it 'defaults maximum balance' do
            expect(subject.maximum_balance).to eq Oystercard::MAXIMUM_BALANCE
        end

        it 'raises an error if the maximum balance is exceeded' do
            subject.top_up Oystercard::MAXIMUM_BALANCE
            expect{ subject.top_up 1 }.to raise_error "Maximum balance of #{Oystercard::MAXIMUM_BALANCE} exceeded"
        end
    end

end
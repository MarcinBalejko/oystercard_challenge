require './lib/oystercard.rb'
describe Oystercard do
    it 'balance equals 0' do
        expect(subject.balance).to eq(0)
    end

    describe '#top_up' do
        it 'can top up the balance' do
            expect{ subject.top_up 1}.to change{ subject.balance }.by 1
        end 
    end

    it 'raises an error if the maximum balance is exceeded' do
        maximum_balance = Oystercard::MAXIMUM_BALANCE
        subject.top_up maximum_balance
        expect{ subject.top_up 1 }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
    end

    describe '#deduct' do
        it 'deducts an amount from the balance' do
            subject.top_up(20)
            expect{ subject.deduct 3 }.to change{ subject.balance }.by -3
        end
    end

    describe '#in_journey?' do
        it 'initially not in journey' do
            expect(subject).not_to be_in_journey
        end
    end

    describe '#touch_in' do
        it 'can touch in' do
            described_class::MAXIMUM_BALANCE.times { subject.top_up(1)}
            subject.touch_in
            expect(subject).to be_in_journey
        end

        it 'will raise an error if the balance is below minimum' do
            expect{ subject.touch_in }.to raise_error 'Insufficient balance to touch in'
        end
    end

    describe '#touch_out' do
        it 'can touch out' do
            described_class::MAXIMUM_BALANCE.times { subject.top_up(1)}
            subject.touch_in
            subject.touch_out
            expect(subject).not_to be_in_journey
        end
    end
    
    describe '#maximum_balance' do
        it 'defaults maximum balance' do
            expect(subject.maximum_balance).to eq Oystercard::MAXIMUM_BALANCE
        end
    end

end
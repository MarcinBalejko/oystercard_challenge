require './lib/oystercard.rb'
describe Oystercard do
    it 'balance equals 0' do
        expect(subject.balance).to eq(0)
    end

    it 'balance will increase by the amount of top up' do
        subject.top_up
        expect(subject.balance).to eq(100)
    end

end
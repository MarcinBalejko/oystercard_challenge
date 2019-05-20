require './lib/oystercard.rb'
describe Oystercard do
    it 'balance equals 0' do
        expect(subject.balance).to eq(0)
    end

end
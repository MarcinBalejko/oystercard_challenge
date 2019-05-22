require './lib/oystercard.rb'
describe Oystercard do

    #let(:station) { double :station }

    #it 'balance equals 0' do
     #   expect(subject.balance).to eq(0)
    #end

    #describe '#top_up' do
     #   it 'can top up the balance' do
      #      expect{ subject.top_up 1}.to change{ subject.balance }.by 1
       # end 
    #end

    #describe '#in_journey?' do
     #   it 'initially not in journey' do
      #      expect(subject).not_to be_in_journey
       # end
    #end

    #describe '#touch_in' do
     #   it 'can touch in' do
      #      subject.top_up Oystercard::MINIMUM_BALANCE
       #     subject.touch_in(station)
        #    expect(subject).to be_in_journey
        #end
        #it 'it stores the entry station' do
         #   subject.top_up Oystercard::MINIMUM_BALANCE
          #  subject.touch_in(station)
           # expect(subject.entry_station).to eq station
        #end
    #end

    #describe '#touch_out' do
     #   it 'can touch out' do
      #      subject.top_up Oystercard::MINIMUM_BALANCE
       #     subject.touch_in(station)
        #    subject.touch_out
         #   expect(subject).not_to be_in_journey
        #end
    #end

    #describe '#deduct' do
     #   it 'deducts amount from the card' do 
      #      subject.top_up Oystercard::MAXIMUM_BALANCE
       #     expect { subject.touch_out }.to change{ subject.balance }.by(-Oystercard::MINIMUM_CHARGE)
        #end
    #end
    
    #describe '#maximum_balance' do
        #it 'defaults maximum balance' do
         #   expect(subject.maximum_balance).to eq Oystercard::MAXIMUM_BALANCE
        #end

        #it 'raises an error if the maximum balance is exceeded' do
        #    maximum_balance = Oystercard::MAXIMUM_BALANCE
       #     subject.top_up maximum_balance
      #      expect{ subject.top_up 1 }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
     #   end
    #end

    #describe '#minimum_balance' do 
     #   it 'raises an error if the balance is below minimum' do
      #      expect{ subject.touch_in(station) }.to raise_error 'Insufficient balance to touch in'
       # end
    #end

    let(:entry_station) { double :station }
    let(:exit_station) { double :station }

        it 'stores the exit station' do
            subject.top_up Oystercard::MAXIMUM_BALANCE
            subject.touch_in(entry_station)
            subject.touch_out(exit_station)
            expect(subject.exit_station).to eq exit_station
        end

end
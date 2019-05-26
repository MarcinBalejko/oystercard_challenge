require_relative 'station'
class Oystercard
    attr_accessor :maximum_balance, :minimum_balance, :minimum_charge, :entry_station, :exit_station, :balance
    attr_reader :list_of_journeys
    MAXIMUM_BALANCE = 20
    MINIMUM_BALANCE = 1
    MINIMUM_CHARGE = 1
    def initialize(maximum_balance = MAXIMUM_BALANCE, minimum_balance = MINIMUM_BALANCE, minimum_charge = MINIMUM_CHARGE)
        @maximum_balance = maximum_balance
        @minimum_balance = minimum_balance
        @minimum_charge = minimum_charge
        @entry_station = entry_station
        @exit_station = exit_station
        @list_of_journeys = {}
        @balance = 0
    end
    def top_up(amount)
        fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if amount + balance > MAXIMUM_BALANCE
        @balance += amount
    end
    def in_journey?
        @entry_station
    end
    def touch_in(entry)
        fail 'Insufficient balance to touch in' if balance < MINIMUM_BALANCE
        @entry_station = entry
    end
    def touch_out(exit)
        deduct(MINIMUM_CHARGE)
        @exit_station = exit
        @list_of_journeys[@entry_station] =  @exit_station
        @entry_station = nil
         
    end

    private

    def deduct(amount)
        @balance -= amount
    end
end
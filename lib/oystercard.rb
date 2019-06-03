require_relative 'station'
require_relative 'journey'
class Oystercard
    attr_accessor :maximum_balance, :minimum_balance, :minimum_charge, :balance, :journey
    attr_reader :list_of_journeys, :current_journeys
    MAXIMUM_BALANCE = 20
    MINIMUM_BALANCE = 1
    MINIMUM_CHARGE = 6
    def initialize(maximum_balance = MAXIMUM_BALANCE, minimum_balance = MINIMUM_BALANCE,
        minimum_charge = MINIMUM_CHARGE, maximum_charge = MAXIMUM_CHARGE, journey=Journey.new)
        @maximum_balance = maximum_balance
        @minimum_balance = minimum_balance
        @minimum_charge = minimum_charge
        @maximum_charge = maximum_charge
        @balance = 0
        @journey = journey   
    end
    def top_up(amount)
        fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if amount + balance > MAXIMUM_BALANCE
        @balance += amount
    end
    def touch_in(entry)
        fail 'Insufficient balance to touch in' if balance < MINIMUM_BALANCE
        journey.start(entry)
    end
    def touch_out(exit)   
        deduct_fare(fare) #here deduct changed for deduct_fare
        journey.finish(exit)
    end

     def deduct_fare(fare)
        @balance -= fare
     end
    def fare
     return 6 if journey.current_journeys[0] == entry_station && journey.current_journeys[1]  == entry_station
     return 6 if journey.current_journeys[0] == exit_station && journey.current_journeys[1]  == exit_station
     MINIMUM_CHARGE
    end
    #

    private

    def deduct(amount)
        @balance -= amount
    end
end
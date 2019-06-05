require_relative 'station'
require_relative 'journey'
class Oystercard
    attr_accessor :maximum_balance, :minimum_balance, :minimum_charge, :maximum_charge, :balance, :journey
    attr_reader :list_of_journeys, :current_journeys, :extra_charge
    MAXIMUM_BALANCE = 20
    MINIMUM_BALANCE = 1
    MINIMUM_CHARGE = 1
    MAXIMUM_CHARGE = 6
    def initialize(maximum_balance = MAXIMUM_BALANCE, minimum_balance = MINIMUM_BALANCE,
        minimum_charge = MINIMUM_CHARGE, maximum_charge = MAXIMUM_CHARGE, journey=Journey.new)
        @maximum_balance = maximum_balance
        @minimum_balance = minimum_balance
        @minimum_charge = minimum_charge
        @maximum_charge = maximum_charge
        @balance = 0   
        @journey = journey
        @extra_charge = false   
    end
    def top_up(amount)
        fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if amount + balance > MAXIMUM_BALANCE
        @balance += amount
    end
    def touch_in(entry)
        fail 'Insufficient balance to touch in' if balance < MINIMUM_BALANCE
        journey.start(entry)
        if journey.current_journeys.count > 1 then @extra_charge = true
        end   
    end
    def touch_out(exit)
         final_fare = journey.calculate_fare(exit)
         @extra_charge == true ? deduct(MAXIMUM_CHARGE) : deduct(final_fare)   
         journey.finish(exit)
         @extra_charge = false
    end
    def extra_charge?
        @extra_charge
    end


    private

    def deduct(amount)
        @balance -= amount
    end
end
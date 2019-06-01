require_relative 'station'
require_relative 'journey'
class Oystercard
    attr_accessor :maximum_balance, :minimum_balance, :minimum_charge, :balance, :journey
    attr_reader :list_of_journeys, :current_journeys
    MAXIMUM_BALANCE = 20
    MINIMUM_BALANCE = 1
    
    def initialize(maximum_balance = MAXIMUM_BALANCE, minimum_balance = MINIMUM_BALANCE, journey=Journey.new)
        @maximum_balance = maximum_balance
        @minimum_balance = minimum_balance
        @minimum_charge = minimum_charge
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

    private

    def deduct(amount)
        @balance -= amount
    end
end
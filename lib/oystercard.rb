class Oystercard
    attr_accessor :maximum_balance, :minimum_balance, :balance, :in_journey
    MAXIMUM_BALANCE = 20
    MINIMUM_BALANCE = 1
    def initialize(maximum_balance = MAXIMUM_BALANCE, minimum_balance = MINIMUM_BALANCE)
        @maximum_balance = maximum_balance
        @minimum_balance = minimum_balance
        @balance = 0
        @in_journey = false
    end
    def top_up(amount)
        fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if amount + balance > MAXIMUM_BALANCE
        @balance += amount
    end
    def deduct(amount)
        @balance -= amount
    end
    def in_journey?
        @in_journey
    end
    def touch_in
        fail 'Insufficient balance to touch in' if balance < MINIMUM_BALANCE
        @in_journey = true
    end
    def touch_out
        @balance -= MINIMUM_BALANCE
        @in_journey = false
    end
end
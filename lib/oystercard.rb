class Oystercard
    attr_reader :balance
    MAXIMUM_BALANCE = 20
    def initialize
        @balance = 0
    end
    def top_up(amount)
        fail 'Maximum balance of 20 exceeded' if amount + balance > MAXIMUM_BALANCE
        @balance += amount
    end
end
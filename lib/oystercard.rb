class Oystercard
    attr_reader :balance
    def initialize
        @balance = 0
    end
    def top_up
        @balance += 100
    end
end
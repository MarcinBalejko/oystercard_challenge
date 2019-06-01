require_relative 'oystercard'
require_relative 'station'
class Journey
    attr_accessor :entry_station, :exit_station, :current_journeys, :list_of_journeys
    MINIMUM_CHARGE = 1
    def initialize(minimum_charge = MINIMUM_CHARGE)
        @current_journeys = []
        @list_of_journeys = {}
        @entry_station = entry_station
        @exit_station = exit_station
    end
    def in_journey?
        @current_journeys[-1]
    end
    def start(entry_station)
        @current_journeys << entry_station
    end
    def finish(exit_station)
        @current_journeys << exit_station
        @list_of_journeys[@current_journeys] =  @list_of_journeys.count + 1
        @current_journeys = [] 
    end
    
    #private

    #def deduct(amount)
     #   @balance -= amount
    #end

    #def finish
    #end
    #def fare
    #end
    #def complete?
    #end
end
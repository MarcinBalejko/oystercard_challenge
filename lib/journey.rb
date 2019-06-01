require_relative 'oystercard'
require_relative 'station'
class Journey
    attr_accessor :entry_station, :exit_station, :current_journeys, :list_of_journeys
    MINIMUM_CHARGE = 1               #test everything in irb / dodac minimum charge(chyba) itd zeby deduct dzialalo
    def initialize(minimum_charge = MINIMUM_CHARGE)
        @current_journeys = []
        @list_of_journeys = {}
        @entry_station = entry_station
        @exit_station = exit_station
        # instantiate card?albo nie i z card initialize journey?
    end
    #trzeba przenieść testy z card do journey
    def in_journey?
        @current_journeys[-1]
    end
    def start(entry_station)
        @current_journeys << entry_station
    end
    def touch_out(exit)
        deduct(MINIMUM_CHARGE)   #card?
        @current_journeys << exit
        @list_of_journeys[@current_journeys] =  @list_of_journeys.count + 1
        @current_journeys = []   
    end
    #def finish
    #end
    #def fare
    #end
    #def complete?
    #end
end
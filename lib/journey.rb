require_relative 'oystercard'
require_relative 'station'
class Journey
    attr_accessor :entry_station, :exit_station, :current_journeys, :list_of_journeys
    def initialize
        @current_journeys = []    
        @list_of_journeys = {}
        @entry_station = entry_station
        @exit_station = exit_station
    end
    def in_journey?
        @current_journeys[-1]
    end
    def start(entry_station)
        @entry_station = entry_station
        @current_journeys << entry_station
    end
    def finish(exit_station)
        @exit_station = exit_station
        @current_journeys << exit_station
        @list_of_journeys[@current_journeys] =  @list_of_journeys.count + 1   
        @current_journeys = [] 
    end
    def complete?   
        return false if @current_journeys[1] == nil  
    end
    def calculate_fare(exit_station)
        station_one_value = entry_station.zone
        station_two_value = exit_station.zone
        fare_value = 1 + (station_two_value - station_one_value)
        fare_value
    end
end
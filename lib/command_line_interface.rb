class CommandLineInterface < ActiveRecord::Base
    
    def run
        greet
        
    end

    def greet
        puts "Welcome to StarLog, the most comprehensive database of interplanetary arrivals and departures."
    end

    def menu
        puts ("1.") + "Land on a new planet"
        puts ("2.") + "See all ships that have landed on a planet"
        puts ("3.") + "Change data for a planet"
        puts ("4.") + "Delete a record of your landing on a planet"
    end

end
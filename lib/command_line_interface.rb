class CommandLineInterface < ActiveRecord::Base
    
    def run
        greet
        menu
        
    end

    def greet
        puts "Welcome to StarLog, the most comprehensive database of interplanetary arrivals and departures."
    end

    def menu
        puts ("1.") + "Land on a new planet"
        puts ("2.") + "See all ships that have landed on a planet"
        puts ("3.") + "Change data for a planet"
        puts ("4.") + "Delete a record of your landing on a planet"
        puts ('5.') + "Exit program"
    end

    def new_planet
        planet = Planet.new
        puts "What is the planet called?"
        planet.name = gets.chomp
        puts "What is the planet's radius in kilometers?"
    end

    end

    def show_all_planets
        Planets.all
    end


end
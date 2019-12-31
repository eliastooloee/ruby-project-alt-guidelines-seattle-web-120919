class CommandLineInterface < ActiveRecord::Base
    
    def run
        greet
        menu
        
    end

    def greet
        puts "Welcome to StarLog, the most comprehensive database of interplanetary arrivals and departures."
    end

    def menu
        puts ("1.") + "Show all planets"
        puts ("2.") + "Show all ships"
        puts ("3.") + "Add a new planet"
        puts ("4.") + "Add a new ship"
        puts ('5.') + "Change data for a planet"
        puts ("6.") + "Change the number of crew on a ship"
        puts ("7.") + "Show all planets a ship has landed on"
        puts ("8.") + "Show all ships that have landed on a planet"
        puts ("9.") + "Delete a record of a ship having landed on a planet"
    end

    def new_planet
        planet = Planet.new
        puts "What is the planet called?"
        planet.name = gets.chomp
        puts "Is the planet inhabited?"
        puts "Input true or false"
        planet.inhabited = 
        planet.save
    end

    end

    def show_all_planets
        Planets.all
    end

    def all_landings_on_a_planet
        puts "Input the name of a planet"
    end


end
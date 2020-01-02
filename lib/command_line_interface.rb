require 'pry'

class CommandLineInterface
    
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
        puts ("10.") + "Exit program"
    end

    def show_all_planets
        puts Planets.all
        binding.pry
    end
    
    def show_all_ships
       puts Starships.all
    end
   
    def new_planet
        planet = Planet.new
        puts "What is the planet called?"
        planet.name = gets.chomp
        puts "Is the planet inhabited?"
        puts "Input yes or no."
        if 
            gets == "yes".downcase
            planet.inhabited = true
        else
            planet.inhabited = false
        end 
        planet.save
    end

    def new_ship
        ship = Starship.new
        puts "What is the name of the ship?"
        ship.name = gets.chomp
        puts "How many crew does the ship have?"
        ship.crew = gets.chomp.to_i
        ship.save
    end

    def change_number_of_crew_on_ship
        "Please enter the name of the ship who's crew you would like to update."
    end

    def show_all_planets_a_ship_has_landed_on

    end

    def all_landings_on_a_planet
        puts "Input the name of a planet"

        name = gets.chomp.to_s
        planet = Planet.find_by(name: name)
        planet.starships
        
    end


end
require 'pry'
require 'colorize'

class CommandLineInterface
    
    def run
        a = Artii::Base.new
        a.asciify('StarLogger')
        puts a.asciify('* * * StarLogger * * *')
        puts "\n"
        greet
        menu
        options
    end

    def greet
        puts "Welcome to StarLogger, the most comprehensive database of interplanetary arrivals and departures. \n".colorize(:yellow)
    end

    def menu
        puts ("(1)") + "Show all planets"
        puts ("(2)") + "Show all ships"
        puts ("(3)") + "Add a new planet"
        puts ("(4)") + "Add a new ship"
        puts ("(5)") + "Record a new landing of a ship on a planet"
        puts ("(6)") + "Change the number of crew on a ship"
        puts ("(7)") + "Show all planets a ship has landed on"
        puts ("(8)") + "Show all ships that have landed on a planet"
        puts ("(9)") + "Delete a record of a ship having landed on a planet"
        puts ("(10)") + "Exit program"
        puts "\n"
    end

    def options
        input = " "
        while input
            input = gets.chomp
            case input
            when "1"
                show_all_planets
            when "2" 
                show_all_ships
            when "3"
                new_planet
            when "4"
                new_ship
            when "5"
                new_landing
            when "6"
                change_number_of_crew_on_ship
            when "7"
                show_all_planets_a_ship_has_landed_on
            when "8"
                all_landings_on_a_planet
            when "9"
                delete_record_of_landing
            when "10"
                break
            else
                puts "Please input a number between 1 and 10"
            end
        end
    end

                




    def show_all_planets
        Planet.all.each do |planet|
            puts planet.name.colorize(:yellow)
            puts "\n"
        end
        menu
        options
    end
    
    def show_all_ships
       Starship.all.each do |starship|
        puts starship.name.colorize(:yellow)
        puts "\n"
       end
       menu
       options
    end
   
    def new_planet
        planet = Planet.new
        puts "What is the planet called?"
        planet.name = gets.chomp.to_s.capitalize
        if !Planet.exists?(name: planet.name)
        # puts "Is the planet inhabited?"
        # puts "Input yes or no."
        # input = gets
        # if 
        #     input == "yes"
        #     planet.inhabited = true
        # else
        #     planet.inhabited = false
        # end 
        planet.save
        puts "Thank you, planet #{planet.name} has been added to StarLogger \n".colorize(:green)
        else
            "A planet with that name already exist. Please choose another name. \n".colorize(:red)
        end
        menu
        options
    end

    def new_ship
        ship = Starship.new
        puts "What is the name of the ship?"
        ship.name = gets.chomp.to_s.capitalize
        if !Starship.exists?(name: ship.name)
            puts "How many crew does the ship have?"
            input = gets
            if input =~ /^-?[0-9]+$/
                ship.crew = input
                ship.save
                puts "Thank you, starship #{ship.name} has been added to StarLogger \n".colorize(:green)
                menu
                options
            else 
            puts "Please enter a whole number with no decimals. \n".colorize(:red)
            end
        else
            puts "A ship with that name already exists, please choose another name. \n".colorize(:red)
        end
        menu
        options
    end

    def new_landing
        new_landing = Landing.new 
        puts "Please enter the name of the ship that is landing."
        landing_ship_name = gets.chomp.to_s.capitalize
        if Starship.exists?(name: landing_ship_name)
            landing_ship = Starship.find_by(name: landing_ship_name)
            new_landing.starship_id = landing_ship.id
            puts "Please enter the name of the planet the ship is landing on."
            planet_name = gets.chomp.to_s.capitalize
            if Planet.exists?(name: planet_name)==true
                planet = Planet.find_by(name: planet_name)
                new_landing.planet_id = planet.id
                new_landing.save
                puts "You have recorded the landing of starship #{landing_ship.name} on planet #{planet.name} \n".colorize(:green)
                menu
                options
            else
                puts "The planet name you entered does not exist in our records. You can view a list of planets in our records by entering 1 in the main menu. \n".colorize(:red)
                menu
                options
            end
        else
            puts "The ship name you entered does not exist in our records. You can view a list of ships in our records by entering 2 in the main menu. \n".colorize(:red)
            menu
            options
        end
    end        

    def change_number_of_crew_on_ship
        puts "Please enter the name of the ship who's crew you would like to update."
        name = gets.chomp.to_s                        
        if Starship.exists?(name: name)==true
            ship = Starship.find_by(name: name)
            puts "Please enter the updated number of crew for starship #{ship.name}"
            input = gets
            if input =~ /^-?[0-9]+$/
                ship.crew = input
                ship.save
                puts "Thank you, the number of crew for starship #{ship.name} has been updated to #{ship.crew} \n.".colorize(:green)
            else
                puts "Please enter a whole number with no decimals. \n".colorize(:red)
            end
        else
            puts "The ship you entered does not exist in our records. You can view a list of ships in our records by entering 2 in the main menu. \n".colorize(:red)
        end
        menu
        options
    end

    def show_all_planets_a_ship_has_landed_on
        puts "Input the name of a ship to see which planets it has landed on."
        name = gets.chomp.to_s.capitalize
        if Starship.exists?(name: name)==true
            ship = Starship.find_by(name: name)
            ship.planets.each do |planet|
                puts planet.name.colorize(:yellow)
                puts "\n"
            end
        else puts "The ship you entered does not exist in our records. You can view a list of ships in our records by entering 2 in the main menu. \n".colorize(:red)
        end
        menu
        options
    end

    def all_landings_on_a_planet
        puts "Input the name of a planet"
        name = gets.chomp.to_s.capitalize
        if Planet.exists?(name: name)==true
            planet = Planet.find_by(name: name)
            planet.starships.each do |starship|
            puts starship.name.colorize(:yellow)
            puts "\n"
            end
        else
            puts "The planet you entered doesn't exist in our records. You can view a list of planets in our records by entering 1 in the main menu \n".colorize(:red)
         end
        menu
        options
    end

    def delete_record_of_landing
        puts "Input the name the ship you want to delete a landing record for."
        ship_name = gets.chomp.to_s.capitalize
        if Starship.exists?(name: ship_name)==true
            ship = Starship.find_by(name: ship_name) 
            puts "Input the name of the planet where you want to erase landing records for Starship #{ship.name}. "
            planet_name = gets.chomp.to_s.capitalize
            if Planet.exists?(name: planet_name)==true
                planet = Planet.find_by(name: planet_name)
                landing = Landing.where({starship_id: ship.id, planet_id: planet.id})
                landing[0].destroy
                puts "You have deleted all records of #{ship.name} landing on #{planet.name}. \n".colorize(:green)
            else
                puts "The planet you entered doesn't exist in our records. \n".colorize(:red)
            end
        else puts "The ship you entered doesn't exist in our records. \n".colorize(:red)
        end
         #check double exit
         menu
         options

    end


end


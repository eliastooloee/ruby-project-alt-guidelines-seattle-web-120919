
# H1 Mod 1 Final Project - StarLogger

**How to Install and Run**

You can find StarLogger at the below github link. Clone it, then run `bundle install` in the terminal to install the gems neccessary to view the program properly.

[github link](https://github.com/eliastooloee/ruby-project-alt-guidelines-seattle-web-120919.git)

You can run Starlogger by navigating to it in your terminal, then entering `ruby bin/run.rb`

**How to Use**

screenshots/Main Menu.png

Once you have entered Starlogger, you can choose from the following options. 

      1 "Show all planets"
        This will display a list of all the planets present in the database.
        screenshots/List of all planets.png

      2 "Show all ships"
        This will display a list of all the starships present in the database.
        screenshots/List of all ships.png

      3 "Add a new planet"
        This will allow you to create a new planet in the database. Simply enter the planet's name. If the planet already exists you will be prompted to choose a different name.
        screenshots/New Planet.png

      4 "Add a new ship"
        This will allow you to create a new starship in the database. You will be asked for a ship name and the number of crew aboard. If the ship already exists you will 
        screenshots/New ship.png

      5 "Record a new landing of a ship on a planet"
        This will allow you to create a new record of a ship landing on a planet. Simply enter the ship's name, followed by the planet's name. If either ship or planet doesn't exist in the database you will be redirected to the main menu.
        screenshots/NewLanding.png

      6 "Change the number of crew on a ship"
        This will allow you to update the number of crew aboard an existing starship. Simply enter the ship name, followed by the new number of crew (integers only!). If the ship doesn't exist in the database you willbe redirected to the main menu.
        screenshots/Crew Update.png

      7 "Show all planets a ship has landed on"
        This will allow you to view a list of all planets a ship has landed on. Simply enter the ship name. If the ship doesn't exist you willl be returned to the main menu.
        screenshots/Landing List.png

      8 "Show all ships that have landed on a planet"
        This will allow you to view a list of all ships that have landed on a planet. Simply enter the planet name. If the planet doesn't exist in the database you will be returned to the main menue.
        screenshots/Ship Landing list.png

      9 "Delete a record of a ship having landed on a planet"
        This will allow you to delete a record of a ship landing on a planet. Simply enter the ship name, followed by the planet name. If either the ship or the planet doesn't exist in the database you will be returned to the main menu.
        screenshots/Delete Landing Record.png

      10 "Exit program"
        Choose this option to exit StarLogger. If you have previously entered other options you may need to enter this command between 2 and 4 times to exit. This is a known bug and will be fixed in the near future.

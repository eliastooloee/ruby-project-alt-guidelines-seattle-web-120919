require 'faker'

10.times do 
    Planet.create(name: Faker::Space.planet, radius: Faker::Number.positive, mass: Faker::Number.positive, atmospheric_pressure: Faker::Number.positive, inhabited: Faker::Boolean.boolean)
end

10.times do
    Starship.create(name: Faker::Space.launch_vehicle, crew: Faker::Number.within(range: 1..10, mass: Faker::Number.positive, thrust: Faker::Number.positive)
end

Landing.create(starship_id: Starship.all.sample.id, planet_id: Planet.all.sample.id)
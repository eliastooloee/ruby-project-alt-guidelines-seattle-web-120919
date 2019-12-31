require 'faker'

10.times do 
    Planet.create(name: Faker::Space.unique.moon, inhabited: Faker::Boolean.boolean)
end

10.times do
    Starship.create(name: Faker::GreekPhilosophers.unique.name, crew: Faker::Number.within(range: 1..10))
end

10.times do
    Landing.create(starship_id: Starship.all.sample.id, planet_id: Planet.all.sample.id)
end
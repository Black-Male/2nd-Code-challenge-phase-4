# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
strength_level = ['Strong', 'Weak', 'Average']

puts "🌱 Seeding data..."

20.times do
    hero= Hero.create(
        name:  Faker::Games::Heroes.name,
        super_name: Faker::Games::WorldOfWarcraft.hero,
    )

    power= Power.create(
        name: Faker::Superhero.power,
        description: Faker::Lorem.paragraph,
    )

    rand(3..6).times do
        HeroPower.create(
            hero: Hero.all.sample,
            power: Power.all.sample,
            strength: strength_level.sample
        )
    end

end

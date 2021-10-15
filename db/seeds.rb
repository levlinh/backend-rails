# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: "test@example.com", password: "123456")
categoriesList = ["fire", "water", "light", "power", "earth"]
categoriesList.each{ |i|
  Category.create(
    name: i,
    id_parent: nil,
    description: "description #{i}"
  )
}

10.times do |i|
  Pokemon.create(
    name: Faker::Name.name,
    description: Faker::Name.name,
    height: 10,
    weight: 20,
    gender: 1,
    skill: "skills pokemon",
    image: "https://www.google.com/url?sa=i&url=http%3A%2F%2Fwww.trochoiviet.com%2Fgame-pikachu%2Fgame.html&psig=AOvVaw3_ph73LU6uWnd9cRy-2AH1&ust=1633835588564000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCIiF14KuvPMCFQAAAAAdAAAAABAD"
  )
end



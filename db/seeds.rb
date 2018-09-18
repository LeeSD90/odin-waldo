# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


p1 = Puzzle.create(title: "Ali Baba And The Forty Thieves", image: "waldo1.jpg")
p1.characters.create(:name => "waldo", :x => 1020, :y => 533)
p1.characters.create(:name => "odlaw", :x => 1303, :y => 478)


#p2 = Puzzle.create(title: "Horseplay In Troy", image: "waldo2.jpg")


#Puzzle.create(title: "The Deep-Sea Divers", image: "waldo3.jpg")

#Puzzle.create(title: "test", image: "waldo1.jpg")

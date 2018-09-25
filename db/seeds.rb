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
p1.characters.create(:name => "wenda", :x => 1212, :y => 167)
p1.characters.create(:name => "wizard_whitebeard", :x => 143, :y => 567)
p1.scores.create(:name => "Bob", :time => 54.5)
p1.scores.create(:name => "Bill", :time => 10.234)
p1.scores.create(:name => "Barney", :time => 723.123)


p2 = Puzzle.create(title: "Horseplay In Troy", image: "waldo2.jpg")
p2.characters.create(:name => "waldo", :x => 220, :y => 725)
p2.characters.create(:name => "odlaw", :x => 1237, :y => 702)
p2.characters.create(:name => "wenda", :x => 1078, :y => 645)
p2.characters.create(:name => "wizard_whitebeard", :x => 398, :y => 50)

p3 = Puzzle.create(title: "The Deep-Sea Divers", image: "waldo3.jpg")
p3.characters.create(:name => "waldo", :x => 928, :y => 146)
p3.characters.create(:name => "odlaw", :x => 421, :y => 173)
p3.characters.create(:name => "wenda", :x => 724, :y => 215)
p3.characters.create(:name => "wizard_whitebeard", :x => 1099, :y => 116)
p3.scores.create(:name => "Bob", :time => 6.12)
p3.scores.create(:name => "Bill", :time => 130.234)
p3.scores.create(:name => "Barney", :time => 723.133)
p3.scores.create(:name => "Bob", :time => 7.5)
p3.scores.create(:name => "Denise", :time => 734.34)
p3.scores.create(:name => "Mary", :time => 42.123)
p3.scores.create(:name => "Bob", :time => 8.45)
p3.scores.create(:name => "John", :time => 53.234)
p3.scores.create(:name => "Derrick", :time => 12.63)
p3.scores.create(:name => "Marie", :time => 14.63)
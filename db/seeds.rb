# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Sport.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
100.times do |index|
  Sport.create!(name: Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 0).chop,
                no_of_players: Faker::Name.name)
end

p "Created #{Sport.count} sports"
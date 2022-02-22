# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Generating artworks for database"
STYLES = ['abstract', 'impressionist', 'cubist', 'realist', 'surrealist', 'minimalist']

20.times do
  artwork = Artwork.new(title: Faker::Book.title,
                        price_per_day: 20.54,
                        artist: Faker::Artist.name,
                        style: STYLES.sample,
                        user: User.find(1),
                        description: "A really interesting description",
                        date: (1000..2000).to_a.sample)
  puts artwork.title
  puts artwork.valid?
  puts artwork.save
end

puts "Finished generating artworks"

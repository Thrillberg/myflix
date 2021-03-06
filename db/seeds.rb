# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


comedies = Category.create(name: "TV Comedies")
dramas = Category.create(name: "TV Dramas")

Video.create!(title: "Monk",
              description: "After the unsolved murder of his wife, Adrian Monk develops obsessive-compulsive disorder, which includes his terror of germs and contamination.",
              small_cover_url: "/tmp/monk.jpg",
              large_cover_url: "/tmp/monk_large.jpg",
              category: dramas)

Video.create!(title: "Futurama",
              description: "Accidentally frozen, pizza-deliverer Fry wakes up 1,000 years in the future.",
              small_cover_url: "/tmp/futurama.jpg",
              large_cover_url: "/tmp/monk_large.jpg",
              category: comedies)

Video.create!(title: "Monk",
              description: "After the unsolved murder of his wife, Adrian Monk develops obsessive-compulsive disorder, which includes his terror of germs and contamination.",
              small_cover_url: "/tmp/monk.jpg",
              large_cover_url: "/tmp/monk_large.jpg",
              category: dramas)

Video.create!(title: "Futurama",
              description: "Accidentally frozen, pizza-deliverer Fry wakes up 1,000 years in the future.",
              small_cover_url: "/tmp/futurama.jpg",
              large_cover_url: "/tmp/monk_large.jpg",
              category: comedies)

Video.create!(title: "Monk",
              description: "After the unsolved murder of his wife, Adrian Monk develops obsessive-compulsive disorder, which includes his terror of germs and contamination.",
              small_cover_url: "/tmp/monk.jpg",
              large_cover_url: "/tmp/monk_large.jpg",
              category: dramas)

Video.create!(title: "Futurama",
              description: "Accidentally frozen, pizza-deliverer Fry wakes up 1,000 years in the future.",
              small_cover_url: "/tmp/futurama.jpg",
              large_cover_url: "/tmp/monk_large.jpg",
              category: comedies)

Video.create!(title: "Monk",
              description: "After the unsolved murder of his wife, Adrian Monk develops obsessive-compulsive disorder, which includes his terror of germs and contamination.",
              small_cover_url: "/tmp/monk.jpg",
              large_cover_url: "/tmp/monk_large.jpg",
              category: dramas)

Video.create!(title: "Futurama",
              description: "Accidentally frozen, pizza-deliverer Fry wakes up 1,000 years in the future.",
              small_cover_url: "/tmp/futurama.jpg",
              large_cover_url: "/tmp/monk_large.jpg",
              category: comedies)


monk = Video.create!(title: "Monk",
                      description: "After the unsolved murder of his wife, Adrian Monk develops obsessive-compulsive disorder, which includes his terror of germs and contamination.",
                      small_cover_url: "/tmp/monk.jpg",
                      large_cover_url: "/tmp/monk_large.jpg",
                      category: dramas)

Video.create!(title: "Futurama",
              description: "Accidentally frozen, pizza-deliverer Fry wakes up 1,000 years in the future.",
              small_cover_url: "/tmp/futurama.jpg",
              large_cover_url: "/tmp/monk_large.jpg",
              category: comedies)

Video.create!(title: "Monk",
              description: "After the unsolved murder of his wife, Adrian Monk develops obsessive-compulsive disorder, which includes his terror of germs and contamination.",
              small_cover_url: "/tmp/monk.jpg",
              large_cover_url: "/tmp/monk_large.jpg",
              category: dramas)

Video.create!(title: "Futurama",
              description: "Accidentally frozen, pizza-deliverer Fry wakes up 1,000 years in the future.",
              small_cover_url: "/tmp/futurama.jpg",
              large_cover_url: "/tmp/monk_large.jpg",
              category: comedies)

eric = User.create!(full_name: "Eric Tillber", password: "password", email: "eric@example.com")

Review.create!(user: eric, video: monk, rating: 5, content: "This is a great movie.")

Review.create!(user: eric, video: monk, rating: 2, content: "This is not an ok movie.")

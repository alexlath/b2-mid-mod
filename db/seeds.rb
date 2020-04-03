# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
mechanic1 = Mechanic.create(
  name:       'Sam Mills',
  experience: 10)
mechanic2 = Mechanic.create(
  name:       'Kara Smith',
  experience: 11)
park = Park.create(
  name:   'Hershey Park',
  price:  '$50.00')
lightning_racer = park.rides.create(
  name: 'Lightning Racer',
  rating: 8)
storm_runner = park.rides.create(
  name: 'Storm Runner',
  rating: 7.9)
the_great_bear = park.rides.create(
  name: 'The Great Bear',
  rating: 7.5)


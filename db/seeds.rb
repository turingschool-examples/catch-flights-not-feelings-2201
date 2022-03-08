# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

united = Airline.create!(name: 'United')
southwest = Airline.create!(name: 'Southwest')

Flight.create!(number: 1, date: '01-02-2000', departure_city: 'Houston', arrival_city: 'Los Angeles', airline: united)
Flight.create!(number: 2, date: '04-02-2000', departure_city: 'San Antonio', arrival_city: 'New York', airline: united)
Flight.create!(number: 3, date: '07-02-2000', departure_city: 'San Francisco', arrival_city: 'Chicago', airline: southwest)


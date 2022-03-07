# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
a1 = Airline.create!(name: "Frontier")
    a2 = Airline.create!(name: "Southwest")
    a3 = Airline.create!(name: "Delta")

    f1 = a1.flights.create!(number: 7990, date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas")
    f2 = a1.flights.create!(number: 7354, date: "2/7/2022", departure_city: "Glendale", arrival_city: "Denver")
    f3 = a1.flights.create!(number: 9235, date: "2/8/2022", departure_city: "SLC", arrival_city: "NYC")
    f4 = a2.flights.create!(number: 1625, date: "2/8/2022", departure_city: "SLC", arrival_city: "Philly")
    f5 = a2.flights.create!(number: 9057, date: "2/8/2022", departure_city: "Greenville", arrival_city: "Asheville")

    p1 = Passenger.create!(name: "Jerry", age: 42)
    p2 = Passenger.create!(name: "George", age: 38)
    p3 = Passenger.create!(name: "Elaine", age: 35)
    p4 = Passenger.create!(name: "Kramer", age: 44)
    p5 = Passenger.create!(name: "Charlie", age: 28)
    p6 = Passenger.create!(name: "Dennis", age: 31)
    p7 = Passenger.create!(name: "Dee", age: 33)
    p8 = Passenger.create!(name: "Frank", age: 75)

    pf1 = PassengerFlight.create!(flight_id: f1.id, passenger_id: p1.id)
    pf2 = PassengerFlight.create!(flight_id: f1.id, passenger_id: p2.id)
    pf3 = PassengerFlight.create!(flight_id: f2.id, passenger_id: p3.id)
    pf4 = PassengerFlight.create!(flight_id: f2.id, passenger_id: p4.id)
    pf5 = PassengerFlight.create!(flight_id: f3.id, passenger_id: p5.id)
    pf6 = PassengerFlight.create!(flight_id: f4.id, passenger_id: p6.id)
    pf7 = PassengerFlight.create!(flight_id: f5.id, passenger_id: p7.id)
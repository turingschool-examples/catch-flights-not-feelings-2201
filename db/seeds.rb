# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@joeline = Airline.create!(name: "The Joeline")

@flight1 = @joeline.flights.create!(number: '123', date: '01/03/2021', arrival_city: "westminster", departure_city: "denver")
@flight2 = @joeline.flights.create!(number: '321', date: '01/03/2021', arrival_city: "westminster", departure_city: "denver")
@flight3 = @joeline.flights.create!(number: '456', date: '01/03/2021', arrival_city: "westminster", departure_city: "denver")
@flight4 = @joeline.flights.create!(number: '654', date: '01/03/2021', arrival_city: "westminster", departure_city: "denver")

@person1 = Passenger.create!(name: "joseph", age: 43)
@person2 = Passenger.create!(name: "je", age: 22)
@person3 = Passenger.create!(name: "ej", age: 120)
@person4 = Passenger.create!(name: "je", age: 5)
@person_flight1 = PassengerFlight.create!(flight_id: @flight1.id, passenger_id: @person1.id)
@person_flight2 = PassengerFlight.create!(flight_id: @flight1.id, passenger_id: @person2.id)
@person_flight3 = PassengerFlight.create!(flight_id: @flight1.id, passenger_id: @person3.id)
@person_flight4 = PassengerFlight.create!(flight_id: @flight1.id, passenger_id: @person4.id)
@person_flight5 = PassengerFlight.create!(flight_id: @flight2.id, passenger_id: @person1.id)
@person_flight6 = PassengerFlight.create!(flight_id: @flight2.id, passenger_id: @person2.id)
@person_flight7 = PassengerFlight.create!(flight_id: @flight1.id, passenger_id: @person3.id)
@person_flight8 = PassengerFlight.create!(flight_id: @flight1.id, passenger_id: @person4.id)

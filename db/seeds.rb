# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Airline.destroy_all
Flight.destroy_all
Passenger.destroy_all
PassengerFlight.destroy_all

@jetblue = Airline.create!(name: "JetBlue")

@flight1 = @jetblue.flights.create!(number: "1", date: "01/01/2022", departure_city: "Miami", arrival_city: "Dallas", airline_id: @jetblue.id)
@flight2 = @jetblue.flights.create!(number: "2", date: "01/10/2022", departure_city: "New Orleans", arrival_city: "Los Angeles", airline_id: @jetblue.id)
@flight3 = @jetblue.flights.create!(number: "3", date: "01/20/2022", departure_city: "Los Angeles", arrival_city: "London", airline_id: @jetblue.id)

@tupac = Passenger.create!(name: "Tupac", age: 24)
@biggie = Passenger.create!(name: "Biggie", age: 17)
@wayne = Passenger.create!(name: "Wayne", age: 21)
@nipsey = Passenger.create!(name: "Nipsey", age: 21)

@fp1 = PassengerFlight.create!(flight_id: @flight1.id, passenger_id: @tupac.id)
@fp2 = PassengerFlight.create!(flight_id: @flight1.id, passenger_id: @wayne.id)
@fp3 = PassengerFlight.create!(flight_id: @flight2.id, passenger_id: @wayne.id)
@fp4 = PassengerFlight.create!(flight_id: @flight2.id, passenger_id: @biggie.id)
@fp5 = PassengerFlight.create!(flight_id: @flight3.id, passenger_id: @tupac.id)
@fp6 = PassengerFlight.create!(flight_id: @flight3.id, passenger_id: @nipsey.id)
@fp7 = PassengerFlight.create!(flight_id: @flight3.id, passenger_id: @wayne.id)

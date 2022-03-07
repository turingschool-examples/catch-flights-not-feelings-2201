# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

FlightPassenger.destroy_all 
Flight.destroy_all
Passenger.destroy_all
Airline.detroy_all 

@airline1 = Airline.create!(name: "American")
@airline2 = Airline.create!(name: "Delta")
@airline3 = Airline.create!(name: "JetBlue")
@airline4 = Airline.create!(name: "Southwest")
@airline5 = Airline.create!(name: "United")

@flight1 = Flight.create!(number: 7990, date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas", airline: @airline1)
@flight2 = Flight.create!(number: 3940, date: "3/10/2022", departure_city: "Detroit", arrival_city: "Orlando", airline: @airline1)
@flight3 = Flight.create!(number: 9091, date: "5/17/2022", departure_city: "Chicago", arrival_city: "Kansas City", airline: @airline2)
@flight4 = Flight.create!(number: 6798, date: "10/9/2022", departure_city: "Tulsa", arrival_city: "Fresno", airline: @airline2)
@flight5 = Flight.create!(number: 9665, date: "11/22/2022", departure_city: "Durham", arrival_city: "New Orleans", airline: @airline3)

@passenger1 = Passenger.create!(name: "Tina Belcher", age: 13)
@passenger2 = Passenger.create!(name: "Louise Belcher", age: 9)
@passenger3 = Passenger.create!(name: "Bob Belcher", age: 46)
@passenger4 = Passenger.create!(name: "Linda Belcher", age: 44)
@passenger5 = Passenger.create!(name: "Big Bob", age: 84)

@fp1 = FlightPassenger.create!(flight: @flight1, passenger: @passenger1)
@fp2 = FlightPassenger.create!(flight: @flight1, passenger: @passenger2)
@fp3 = FlightPassenger.create!(flight: @flight2, passenger: @passenger1)
@fp4 = FlightPassenger.create!(flight: @flight2, passenger: @passenger3)
@fp5 = FlightPassenger.create!(flight: @flight3, passenger: @passenger4)
@fp6 = FlightPassenger.create!(flight: @flight4, passenger: @passenger4)
@fp7 = FlightPassenger.create!(flight: @flight5, passenger: @passenger5)
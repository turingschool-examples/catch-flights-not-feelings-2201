# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@airline1 = Airline.create(name: "JetBlue")
@airline2 = Airline.create(name: "Southwest")
@airline3 = Airline.create(name: "United")

@flight1 = Flight.create(number: "7990", date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas", airline_id: 1)
@flight2 = Flight.create(number: "3940", date: "3/10/2022", departure_city: "Detroit", arrival_city: "Orlando", airline_id: 1)
@flight3 = Flight.create(number: "9091", date: "5/17/2022", departure_city: "Chicago", arrival_city: "Kansas City", airline_id: 2)
@flight4 = Flight.create(number: "6798", date: "10/9/2022", departure_city: "Tulsa", arrival_city: "Fresno", airline_id: 3)
@flight5 = Flight.create(number: "9665", date: "11/22/2022", departure_city: "Durham", arrival_city: "New Orleans", airline_id: 3)

@passenger1  = Passenger.create(name: "Pabu", age: 20)
@passenger2  = Passenger.create(name: "Thor", age: 15)
@passenger3  = Passenger.create(name: "Loki", age: 19)
@passenger4  = Passenger.create(name: "Apollo", age: 14)
@passenger5  = Passenger.create(name: "Ian", age: 18)

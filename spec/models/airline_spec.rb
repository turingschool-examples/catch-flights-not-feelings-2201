require 'rails_helper'

RSpec.describe Airline, type: :model do
  it { should have_many :flights }

  it 'gives all adult passengers' do
    airline1 = Airline.create(name: "American")
    # 2 adults on flight1
    flight1 = airline1.flights.create(number: "7990", date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas")
    passenger1 = Passenger.create(name: "Tina Belcher", age: 13)
    passenger2 = Passenger.create(name: "Louise Belcher", age: 31)
    passenger3 = Passenger.create(name: "Bob Belcher", age: 46)
    FlightPassenger.create(flight_id: flight1.id, passenger_id: passenger1.id)
    FlightPassenger.create(flight_id: flight1.id, passenger_id: passenger2.id)
    FlightPassenger.create(flight_id: flight1.id, passenger_id: passenger3.id)
    # 2 adults on flight2, including one duplicate
    flight2 = airline1.flights.create(number: "7990", date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas")
    passenger4 = Passenger.create(name: "Jill Belcher", age: 2)
    passenger5 = Passenger.create(name: "Dirk Belcher", age: 18)
    FlightPassenger.create(flight_id: flight2.id, passenger_id: passenger4.id)
    FlightPassenger.create(flight_id: flight2.id, passenger_id: passenger5.id)
    # passenger3 is on both flights
    FlightPassenger.create(flight_id: flight2.id, passenger_id: passenger3.id)
    # passengers only riding on other airlines will now show up
    airline2 = Airline.create(name: "Frontier")
    flight3 = airline2.flights.create(number: "6666", date: "3/7/2022", departure_city: "Poughkeepsie", arrival_city: "Houston")
    passenger6 = Passenger.create(name: "Clem Belcher", age: 50)

    expected = [passenger2.name, passenger3.name, passenger5.name]

    actual = airline1.all_adult_passengers.map do |passenger|
      passenger.name
    end

    expect(actual).to eq(expected)
  end
end

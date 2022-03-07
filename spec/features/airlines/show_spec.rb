require 'rails_helper'

RSpec.describe "Airline Show Page" do
  it "displays adult passengers who have flights on that airline once" do

    airline = Airline.create!(name: "Delta")
    airline2 = Airline.create!(name: "Spirit")

    flight = Flight.create!(number: 112, date: "August-12-2022", departure_city: "Atlanta", arrival_city: "Chicago", airline_id: airline.id )
    flight2 = Flight.create!(number: 112, date: "August-15-2022", departure_city: "Chicago", arrival_city: "Atlanta", airline_id: airline.id )

    flight3 = Flight.create!(number: 211, date: "September-13-2022", departure_city: "New York", arrival_city: "Boston", airline_id: airline2.id )

    passenger = Passenger.create!(name: "Zerg", age: 32)
    passenger2 = Passenger.create!(name: "Tina", age: 34)
    passenger3 = Passenger.create!(name: "Little Tina", age: 9)
    passenger4 = Passenger.create!(name: "Little Taylor", age: 17)

    passenger5 = Passenger.create!(name: "Terran", age: 32)
    passenger6 = Passenger.create!(name: "Bob", age: 36)
    passenger7 = Passenger.create!(name: "Little Bob", age: 8)

    flight_passengers = FlightPassenger.create!(flight_id: flight.id, passenger_id: passenger.id)
    flight_passengers2 = FlightPassenger.create!(flight_id: flight.id, passenger_id: passenger2.id)
    flight_passengers3 = FlightPassenger.create!(flight_id: flight.id, passenger_id: passenger3.id)
    flight_passengers3 = FlightPassenger.create!(flight_id: flight.id, passenger_id: passenger4.id)

    flight_passengers4 = FlightPassenger.create!(flight_id: flight2.id, passenger_id: passenger.id)
    flight_passengers5 = FlightPassenger.create!(flight_id: flight2.id, passenger_id: passenger2.id)
    flight_passengers6 = FlightPassenger.create!(flight_id: flight2.id, passenger_id: passenger3.id)
    flight_passengers6 = FlightPassenger.create!(flight_id: flight2.id, passenger_id: passenger4.id)

    flight_passengers7 = FlightPassenger.create!(flight_id: flight3.id, passenger_id: passenger5.id)
    flight_passengers8 = FlightPassenger.create!(flight_id: flight3.id, passenger_id: passenger6.id)
    flight_passengers9 = FlightPassenger.create!(flight_id: flight3.id, passenger_id: passenger7.id)


    visit "/airlines/#{airline.id}"

    airline.passengers.adult.each do |passenger|
      expect(page).to have_content(passenger.name)
    end

    expect(page).to_not have_content(passenger3.name)
    expect(page).to_not have_content(passenger4.name)
    expect(page).to_not have_content(passenger5.name)
    expect(page).to_not have_content(passenger6.name)
    expect(page).to_not have_content(passenger7.name)
  end

  xit "displays adult frequent flyer passengers" do

    airline = Airline.create!(name: "Delta")
    airline2 = Airline.create!(name: "Spirit")

    flight = Flight.create!(number: 112, date: "August-12-2022", departure_city: "Atlanta", arrival_city: "Chicago", airline_id: airline.id )
    flight2 = Flight.create!(number: 112, date: "August-15-2022", departure_city: "Chicago", arrival_city: "Atlanta", airline_id: airline.id )

    flight3 = Flight.create!(number: 211, date: "September-13-2022", departure_city: "New York", arrival_city: "Boston", airline_id: airline2.id )

    passenger = Passenger.create!(name: "Zerg", age: 32)
    passenger2 = Passenger.create!(name: "Tina", age: 34)
    passenger3 = Passenger.create!(name: "Little Tina", age: 9)
    passenger4 = Passenger.create!(name: "Little Taylor", age: 17)

    passenger5 = Passenger.create!(name: "Terran", age: 32)
    passenger6 = Passenger.create!(name: "Bob", age: 36)
    passenger7 = Passenger.create!(name: "Little Bob", age: 8)

    flight_passengers = FlightPassenger.create!(flight_id: flight.id, passenger_id: passenger.id)
    flight_passengers2 = FlightPassenger.create!(flight_id: flight.id, passenger_id: passenger2.id)
    flight_passengers3 = FlightPassenger.create!(flight_id: flight.id, passenger_id: passenger3.id)
    flight_passengers3 = FlightPassenger.create!(flight_id: flight.id, passenger_id: passenger4.id)

    flight_passengers4 = FlightPassenger.create!(flight_id: flight2.id, passenger_id: passenger.id)
    flight_passengers5 = FlightPassenger.create!(flight_id: flight2.id, passenger_id: passenger2.id)
    flight_passengers6 = FlightPassenger.create!(flight_id: flight2.id, passenger_id: passenger3.id)
    flight_passengers6 = FlightPassenger.create!(flight_id: flight2.id, passenger_id: passenger4.id)

    flight_passengers7 = FlightPassenger.create!(flight_id: flight3.id, passenger_id: passenger5.id)
    flight_passengers8 = FlightPassenger.create!(flight_id: flight3.id, passenger_id: passenger6.id)
    flight_passengers9 = FlightPassenger.create!(flight_id: flight3.id, passenger_id: passenger7.id)


    visit "/airlines/#{airline.id}"

    airline.passengers.frequent_flyers.each do |passenger|
      expect(page).to have_content(passenger.name)
    end
  end
end

require 'rails_helper'

RSpec.describe "Flights Index Page" do
  it "displays flights and their information" do
    airline = Airline.create!(name: "Delta")
    airline2 = Airline.create!(name: "Spirit")
    flight = Flight.create!(number: 112, date: "August-12-2022", departure_city: "Atlanta", arrival_city: "Chicago", airline_id: airline.id )
    flight2 = Flight.create!(number: 211, date: "September-13-2022", departure_city: "New York", arrival_city: "Boston", airline_id: airline2.id )
    passenger = Passenger.create!(name: "Mike", age: 32)
    passenger2 = Passenger.create!(name: "Dani", age: 32)
    flight_passengers = FlightPassenger.create!(flight_id: flight.id, passenger_id: passenger.id)
    flight_passengers2 = FlightPassenger.create!(flight_id: flight2.id, passenger_id: passenger2.id)
    visit "/flights"

    expect(page).to have_content(flight.number)
    expect(page).to have_content(flight.airline.name)
    flight.passengers.each do |passenger|
      expect(page).to have_content(passenger.name)
    end

    expect(page).to have_content(flight2.number)
    expect(page).to have_content(flight2.airline.name)
    flight2.passengers.each do |passenger|
      expect(page).to have_content(passenger.name)
    end
  end

  it "displays a link to remove a passenger from a flight" do
    airline = Airline.create!(name: "Delta")
    airline2 = Airline.create!(name: "Spirit")
    flight = Flight.create!(number: 112, date: "August-12-2022", departure_city: "Atlanta", arrival_city: "Chicago", airline_id: airline.id )
    flight2 = Flight.create!(number: 211, date: "September-13-2022", departure_city: "New York", arrival_city: "Boston", airline_id: airline2.id )
    passenger = Passenger.create!(name: "Mike", age: 32)
    passenger2 = Passenger.create!(name: "Dani", age: 32)
    flight_passengers = FlightPassenger.create!(flight_id: flight.id, passenger_id: passenger.id)
    flight_passengers2 = FlightPassenger.create!(flight_id: flight2.id, passenger_id: passenger2.id)

    visit "/flights"
    click_on("Remove Passenger", match: :first)

    expect(current_path).to eq("/flights")

    flight.passengers.each do |passenger|
      expect(page).to_not have_content(passenger.name)
    end
  end
end

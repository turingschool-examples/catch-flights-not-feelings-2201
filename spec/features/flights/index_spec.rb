require 'rails_helper'
# User Story 1, Flights Index Page
#
# As a visitor
# When I visit the flights index page
# I see a list of all flight numbers
# And next to each flight number I see the name of the Airline of that flight
# And under each flight number I see the names of all that flight's passengers

RSpec.describe 'flight index page' do
  it 'can see the name of the Airline of that flight' do
    airline = Airline.create(name: "American")
    airline_2 = Airline.create(name: "LAM")
    flight_1 = airline.flights.create(number: "1727", date: "08/03/20", departure_city: "Denver", arrival_city: "Reno")
    flight_2 = airline_2.flights.create(number: "1567", date: "07/03/20", departure_city: "Cali", arrival_city: "Bogota")

    ana = Passenger.create(name: 'Ana', age: 45)
    eva = Passenger.create(name: 'Eva', age: 37)
    nelson = Passenger.create(name: 'Nelson', age: 40)
    adalid = Passenger.create(name: 'Adalid', age: 4)

    PassengerFlight.create(flight_id: flight_1.id, passenger_id: ana.id)
    PassengerFlight.create(flight_id: flight_1.id, passenger_id: eva.id)
    PassengerFlight.create(flight_id: flight_2.id, passenger_id: nelson.id)
    PassengerFlight.create(flight_id: flight_2.id, passenger_id: adalid.id)

    visit "/flights"

    within "#flight-#{flight_1.id}" do
      expect(page).to have_content(flight_1.number)
      expect(page).to have_content(airline.name)
      expect(page).to have_content(ana.name)
      expect(page).to have_content(eva.name)
    end

    within "#flight-#{flight_2.id}" do
      expect(page).to have_content(flight_2.number)
      expect(page).to have_content(airline_2.name)
      expect(page).to have_content(nelson.name)
      expect(page).to have_content(adalid.name)
    end
  end

#   User Story 2, Remove a Passenger from a Flight
#
# As a visitor
# When I visit the flights index page
# Next to each passengers name
# I see a link or button to remove that passenger from that flight
# When I click on that link/button
# I'm returned to the flights index page
# And I no longer see that passenger listed under that flight
#
# (Note: you should not destroy the passenger record entirely)

  it 'can see a link or button to remove that passenger from that flight' do
    airline = Airline.create(name: "American")
    airline_2 = Airline.create(name: "LAM")
    flight_1 = airline.flights.create(number: "1727", date: "08/03/20", departure_city: "Denver", arrival_city: "Reno")
    flight_2 = airline_2.flights.create(number: "1567", date: "07/03/20", departure_city: "Cali", arrival_city: "Bogota")

    ana = Passenger.create(name: 'Ana', age: 45)
    eva = Passenger.create(name: 'Eva', age: 37)
    nelson = Passenger.create(name: 'Nelson', age: 40)
    adalid = Passenger.create(name: 'Adalid', age: 4)

    PassengerFlight.create(flight_id: flight_1.id, passenger_id: ana.id)
    PassengerFlight.create(flight_id: flight_1.id, passenger_id: eva.id)
    PassengerFlight.create(flight_id: flight_2.id, passenger_id: nelson.id)
    PassengerFlight.create(flight_id: flight_2.id, passenger_id: adalid.id)

    visit "/flights"

    expect(page).to have_button("Delete #{ana.name}")

    click_button("Delete #{ana.name}")
    expect(current_path).to eq("/flights")

    expect(page).to_not have_content(ana.name)
  end
end

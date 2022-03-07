require 'rails_helper'
# User Story 3, Airline's Passengers
#
# As a visitor
# When I visit an airline's show page
# Then I see a list of passengers that have flights on that airline
# And I see that this list is unique (no duplicate passengers)
# And I see that this list only includes adult passengers
#
# (Note: an adult is anyone with age greater than or equal to 18)
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

    visit "/airlines/#{airline.id}"

    expect(page).to have_content("#{ana.name} #{eva.name}")
    expect(page).to_not have_content(adalid.name)
  end
end

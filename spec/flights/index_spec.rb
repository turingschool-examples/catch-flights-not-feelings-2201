require 'rails_helper'

RSpec.describe 'flights index page' do
  it "exists and displays all flight numbers, that flight's airline name, and the name of all of that flight's passengers" do
    airline_a = Airline.create!(name: 'Airline A')
    airline_b = Airline.create!(name: 'Airline B')

    flight_a1 = airline_a.flights.create!(number: 'Flight A1', date: '01-01-1001', departure_city: 'Denver', arrival_city: 'Laurel')
    flight_a2 = airline_a.flights.create!(number: 'Flight A2', date: '01-01-1002', departure_city: 'Denver', arrival_city: 'Laurel')
    flight_b1 = airline_b.flights.create!(number: 'Flight B1', date: '01-01-2001', departure_city: 'Denver', arrival_city: 'Laurel')

    passenger_1 = Passenger.create!(name: 'Passenger 1', age: 10)
    passenger_2 = Passenger.create!(name: 'Passenger 2', age: 20)
    passenger_3 = Passenger.create!(name: 'Passenger 3', age: 30)
    passenger_4 = Passenger.create!(name: 'Passenger 4', age: 40)
    passenger_5 = Passenger.create!(name: 'Passenger 5', age: 50)

    passenger_flight_1_a1 = PassengerFlight.create!(passenger_id: passenger_1.id, flight_id: flight_a1.id)
    passenger_flight_1_a2 = PassengerFlight.create!(passenger_id: passenger_1.id, flight_id: flight_a2.id)
    passenger_flight_1_b1 = PassengerFlight.create!(passenger_id: passenger_1.id, flight_id: flight_b1.id)
    passenger_flight_2_a1 = PassengerFlight.create!(passenger_id: passenger_2.id, flight_id: flight_a1.id)
    passenger_flight_2_a2 = PassengerFlight.create!(passenger_id: passenger_2.id, flight_id: flight_a2.id)
    passenger_flight_3_a1 = PassengerFlight.create!(passenger_id: passenger_3.id, flight_id: flight_a1.id)
    passenger_flight_3_b1 = PassengerFlight.create!(passenger_id: passenger_3.id, flight_id: flight_b1.id)
    passenger_flight_4_a1 = PassengerFlight.create!(passenger_id: passenger_4.id, flight_id: flight_a1.id)

    visit "/flights"
    expect(current_path).to eq("/flights")

    within ".flight-#{flight_a1.id}" do
      expect(page).to have_content(flight_a1.number)
      expect(page).to_not have_content(flight_a2.number)
      expect(page).to_not have_content(flight_b1.number)

      expect(page).to have_content(airline_a.name)
      expect(page).to_not have_content(airline_b.name)

      expect(page).to have_content(passenger_1.name)
      expect(page).to have_content(passenger_2.name)
      expect(page).to have_content(passenger_3.name)
      expect(page).to have_content(passenger_4.name)
      expect(page).to_not have_content(passenger_5.name)
    end

    within ".flight-#{flight_a2.id}" do
      expect(page).to_not have_content(flight_a1.number)
      expect(page).to have_content(flight_a2.number)
      expect(page).to_not have_content(flight_b1.number)

      expect(page).to have_content(airline_a.name)
      expect(page).to_not have_content(airline_b.name)

      expect(page).to have_content(passenger_1.name)
      expect(page).to have_content(passenger_2.name)
      expect(page).to_not have_content(passenger_3.name)
      expect(page).to_not have_content(passenger_4.name)
      expect(page).to_not have_content(passenger_5.name)
    end

    within ".flight-#{flight_b1.id}" do
      expect(page).to_not have_content(flight_a1.number)
      expect(page).to_not have_content(flight_a2.number)
      expect(page).to have_content(flight_b1.number)

      expect(page).to_not have_content(airline_a.name)
      expect(page).to have_content(airline_b.name)

      expect(page).to have_content(passenger_1.name)
      expect(page).to_not have_content(passenger_2.name)
      expect(page).to have_content(passenger_3.name)
      expect(page).to_not have_content(passenger_4.name)
      expect(page).to_not have_content(passenger_5.name)
    end
  end
end

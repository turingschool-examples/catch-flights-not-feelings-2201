require 'rails_helper'

RSpec.describe 'flights index page' do
  it 'displays a list of all flight numbers and the airline name' do
    airline_1 = Airline.create!(name: "JetBlue")
    flight_1 = airline_1.flights.create!(number: 7990, date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas")
    flight_2 = airline_1.flights.create!(number: 3940, date: "3/10/2022", departure_city: "Detroit", arrival_city: "Orlando")
    flight_3 = airline_1.flights.create!(number: 9091, date: "5/17/2022", departure_city: "Chicago", arrival_city: "Kansas City")

    airline_2 = Airline.create!(name: "Delta")
    flight_4 = airline_2.flights.create!(number: 6798, date: "10/9/2022", departure_city: "Tulsa", arrival_city: "Fresno")
    flight_5 = airline_2.flights.create!(number: 9665, date: "11/22/2022", departure_city: "Durham", arrival_city: "New Orleans")

    visit "flights"

    expect(page).to have_content("All Flights")

    within("#flight-#{flight_1.number}") do
      expect(page).to have_content(flight_1.number)
      expect(page).to have_content(airline_1.name)
    end

    within("#flight-#{flight_2.number}") do
      expect(page).to have_content(flight_2.number)
      expect(page).to have_content(airline_1.name)
    end

    within("#flight-#{flight_3.number}") do
      expect(page).to have_content(flight_3.number)
      expect(page).to have_content(airline_1.name)
    end

    within("#flight-#{flight_4.number}") do
      expect(page).to have_content(flight_4.number)
      expect(page).to have_content(airline_2.name)
    end

    within("#flight-#{flight_5.number}") do
      expect(page).to have_content(flight_5.number)
      expect(page).to have_content(airline_2.name)
    end
  end

  it 'shows the names of all the flights passengers' do
    airline_1 = Airline.create!(name: "JetBlue")
    flight_1 = airline_1.flights.create!(number: 7990, date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas")
    flight_2 = airline_1.flights.create!(number: 3940, date: "3/10/2022", departure_city: "Detroit", arrival_city: "Orlando")
    flight_3 = airline_1.flights.create!(number: 9091, date: "5/17/2022", departure_city: "Chicago", arrival_city: "Kansas City")
    passenger_1 = Passenger.create!(name: "Tina Belcher", age: 13)
    passenger_2 = Passenger.create!(name: "Bob Belcher", age: 46)
    passenger_3 = Passenger.create!(name: "Louise Belcher", age: 9)
    passenger_4 = Passenger.create!(name: "Linda", age: 44)
    passenger_5 = Passenger.create!(name: "Big Bob", age: 84)

    PassengerFlight.create!(passenger_id: passenger_1.id, flight_id: flight_1.id)
    PassengerFlight.create!(passenger_id: passenger_2.id, flight_id: flight_1.id)

    PassengerFlight.create!(passenger_id: passenger_3.id, flight_id: flight_2.id)
    PassengerFlight.create!(passenger_id: passenger_4.id, flight_id: flight_2.id)

    PassengerFlight.create!(passenger_id: passenger_5.id, flight_id: flight_3.id)

    visit "/flights"

    within("#flight-#{flight_1.number}") do
      expect(page).to have_content(passenger_1.name)
      expect(page).to have_content(passenger_2.name)
    end

    within("#flight-#{flight_2.number}") do
      expect(page).to have_content(passenger_3.name)
      expect(page).to have_content(passenger_4.name)
    end

    within("#flight-#{flight_3.number}") do
      expect(page).to have_content(passenger_5.name)
    end
  end

  it 'can remove a passenger from a flight' do
    airline_1 = Airline.create!(name: "JetBlue")
    flight_1 = airline_1.flights.create!(number: 7990, date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas")
    passenger_1 = Passenger.create!(name: "Tina Belcher", age: 13)
    passenger_2 = Passenger.create!(name: "Bob Belcher", age: 46)
    PassengerFlight.create!(passenger_id: passenger_1.id, flight_id: flight_1.id)
    PassengerFlight.create!(passenger_id: passenger_2.id, flight_id: flight_1.id)

    visit "/flights"

    within("#flight-#{flight_1.number}") do
      expect(page).to have_button("Remove #{passenger_1.name}")

      click_button("Remove #{passenger_1.name}")
      expect(current_path).to eq("/flights")
    end

    within("#flight-#{flight_1.number}") do
      expect(page).to_not have_content(passenger_1.name)
    end
  end
end

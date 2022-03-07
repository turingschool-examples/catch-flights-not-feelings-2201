require 'rails_helper'

RSpec.describe 'Flights Index Page' do

  it 'lists all flight numbers, as well as the name of the airline the flight belongs to' do 
    american = Airline.create!(name: "American")
    delta = Airline.create!(name: "Delta")
    smelta = Airline.create!(name: "Smelta")
    flight1 = Flight.create!(number: 7990, date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas", airline_id: american.id)
    flight2 = Flight.create!(number: 3940, date: "3/10/2022", departure_city: "Detriot", arrival_city: "Orlando", airline_id: american.id)
    flight3 = Flight.create!(number: 9091, date: "5/17/2022", departure_city: "Chicago", arrival_city: "Kansas City", airline_id: delta.id)
    
    visit flights_path
    within "#flights-#{flight1.id}" do
      expect(page).to have_content(american.name)
      expect(page).to have_content(flight1.id)
    end 
    within "#flights-#{flight2.id}" do
      expect(page).to have_content(american.name)
      expect(page).to have_content(flight2.id)
    end 
    within "#flights-#{flight3.id}" do
      expect(page).to have_content(delta.name)
      expect(page).to have_content(flight3.id)
    end 
    expect(page).to have_no_content(smelta.name)
  end

  it 'lists the names of all of a flights passengers on a flight' do
    american = Airline.create!(name: "American")
    delta = Airline.create!(name: "Delta")
    smelta = Airline.create!(name: "Smelta")
    flight1 = Flight.create!(number: 7990, date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas", airline_id: american.id)
    flight2 = Flight.create!(number: 3940, date: "3/10/2022", departure_city: "Detriot", arrival_city: "Orlando", airline_id: american.id)
    flight3 = Flight.create!(number: 9091, date: "5/17/2022", departure_city: "Chicago", arrival_city: "Kansas City", airline_id: delta.id)
    passenger1 = Passenger.create!(name: "Tina Belcher")
    passenger2 = Passenger.create!(name: "Linda Belcher")
    passenger3 = Passenger.create!(name: "Louise Belcher")
    passenger4 = Passenger.create!(name: "Bob Belcher")
    joins1 = FlightPassenger.create!(flight_id: flight1.id, passenger_id: passenger1.id)
    joins2 = FlightPassenger.create!(flight_id: flight2.id, passenger_id: passenger2.id)
    joins3 = FlightPassenger.create!(flight_id: flight3.id, passenger_id: passenger3.id)

    visit flights_path
    within "#flights-#{flight1.id}" do
    expect(page).to have_content(passenger1.name)
    end 
    within "#flights-#{flight2.id}" do
    expect(page).to have_content(passenger2.name)
    end 
    within "#flights-#{flight3.id}" do
    expect(page).to have_content(passenger3.name)
    end 
    expect(page).to have_no_content(passenger4.name)
  end 

  it 'has a button that removes a passenger from a flight' do 
    american = Airline.create!(name: "American")
    delta = Airline.create!(name: "Delta")
    smelta = Airline.create!(name: "Smelta")
    flight1 = Flight.create!(number: 7990, date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas", airline_id: american.id)
    flight2 = Flight.create!(number: 3940, date: "3/10/2022", departure_city: "Detriot", arrival_city: "Orlando", airline_id: american.id)
    flight3 = Flight.create!(number: 9091, date: "5/17/2022", departure_city: "Chicago", arrival_city: "Kansas City", airline_id: delta.id)
    passenger1 = Passenger.create!(name: "Tina Belcher")
    passenger2 = Passenger.create!(name: "Linda Belcher")
    passenger3 = Passenger.create!(name: "Louise Belcher")
    joins1 = FlightPassenger.create!(flight_id: flight1.id, passenger_id: passenger1.id)
    joins2 = FlightPassenger.create!(flight_id: flight2.id, passenger_id: passenger2.id)
    joins3 = FlightPassenger.create!(flight_id: flight3.id, passenger_id: passenger3.id)

    visit flights_path
    within "#flights-#{flight1.id}" do
      expect(page).to have_content(passenger1.name)
      expect(page).to have_button("Remove #{passenger1.name}")
      click_button("Remove #{passenger1.name}")
      expect(page).to have_no_content(passenger1.name)
      # Attempt to demonstrate that Passenger1 is not deleted entirely, only joins row was deleted. 
      expect(passenger1).to be_a(Passenger)
    end 
  end 
end 
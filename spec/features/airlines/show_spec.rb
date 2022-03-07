require 'rails_helper'

RSpec.describe 'The Airlines Show Page' do
  it 'lists passengers that have flights on that airline, without duplicate listings' do 
    american = Airline.create!(name: "American")
    delta = Airline.create!(name: "Delta")
    flight1 = Flight.create!(number: 7990, date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas", airline_id: american.id)
    flight2 = Flight.create!(number: 3940, date: "3/10/2022", departure_city: "Detriot", arrival_city: "Orlando", airline_id: american.id)
    flight3 = Flight.create!(number: 9091, date: "5/17/2022", departure_city: "Chicago", arrival_city: "Kansas City", airline_id: delta.id)
    passenger1 = Passenger.create!(name: "Tina", age: 18)
    passenger2 = Passenger.create!(name: "Linda", age: 43)
    passenger3 = Passenger.create!(name: "Louise", age: 12)
    joins1 = FlightPassenger.create!(flight_id: flight1.id, passenger_id: passenger1.id)
    joins2 = FlightPassenger.create!(flight_id: flight2.id, passenger_id: passenger2.id)
    joins3 = FlightPassenger.create!(flight_id: flight3.id, passenger_id: passenger3.id)

    visit airline_path(american.id)
    expect(page).to have_content(american.name)
    expect(page).to have_no_content(delta.name)

    within '#tina' do 
      expect(page).to have_content(passenger1.name, count: 1)
    end 

    within '#linda' do 
      expect(page).to have_content(passenger2.name, count: 1)
    end 
    expect(page).to have_no_content(passenger3.name)
  end 

  it 'only lists adult passengers' do 
    american = Airline.create!(name: "American")
    delta = Airline.create!(name: "Delta")
    flight1 = Flight.create!(number: 7990, date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas", airline_id: american.id)
    flight2 = Flight.create!(number: 3940, date: "3/10/2022", departure_city: "Detriot", arrival_city: "Orlando", airline_id: american.id)
    flight3 = Flight.create!(number: 9091, date: "5/17/2022", departure_city: "Chicago", arrival_city: "Kansas City", airline_id: delta.id)
    passenger1 = Passenger.create!(name: "Tina", age: 15)
    passenger2 = Passenger.create!(name: "Linda", age: 43)
    passenger3 = Passenger.create!(name: "Louise", age: 12)
    passenger4 = Passenger.create!(name: "Bob", age: 44)
    joins1 = FlightPassenger.create!(flight_id: flight1.id, passenger_id: passenger1.id)
    joins2 = FlightPassenger.create!(flight_id: flight2.id, passenger_id: passenger2.id)
    joins3 = FlightPassenger.create!(flight_id: flight3.id, passenger_id: passenger3.id)
    joins4 = FlightPassenger.create!(flight_id: flight1.id, passenger_id: passenger4.id)

    visit airline_path(american.id)

    within '#bob' do 
      expect(page).to have_content(passenger4.name, count: 1)
    end 

    within '#linda' do 
      expect(page).to have_content(passenger2.name, count: 1)
    end 
    expect(page).to have_no_content(passenger1.name)
  end 
end 
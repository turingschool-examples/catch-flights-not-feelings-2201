require 'rails_helper'

RSpec.describe 'Airline show page' do
  it 'displays airline passengers over age 18 without duplicates' do
    airline1 = Airline.create!(name: "Spirit")

    flight1 = Flight.create!(number: "123", date: "01/01/1999", departure_city: "Denver", arrival_city: "Austin", airline_id: airline1.id)
    flight2 = Flight.create!(number: "456", date: "01/01/1999", departure_city: "Wonderland", arrival_city: "London", airline_id: airline1.id)

    under_18_passenger = flight1.passengers.create!(name: "Tina Belcher", age: 13)

    two_flight_passenger = Passenger.create!(name: "Bob", age: 20)
    duplicate_passenger1 = FlightPassenger.create!(passenger_id: two_flight_passenger.id, flight_id: flight1.id)
    duplicate_passenger2 = FlightPassenger.create!(passenger_id: two_flight_passenger.id, flight_id: flight2.id)

    passenger3 = flight1.passengers.create!(name: "May", age: 30)

    passenger4 = flight1.passengers.create!(name: "George", age: 50)

    passenger5 = flight2.passengers.create!(name: "Daniel", age: 20)

    passenger6 = flight2.passengers.create!(name: "Mike", age: 40)

    visit "/airlines/#{airline1.id}"

    # do not display under 18 yrs
    expect(page).not_to have_content(under_18_passenger.name)

    # display passengers with multiple flights only once
    expect(page).to have_content(two_flight_passenger.name, count: 1)

    # display all passengers on this airline
    expect(page).to have_content(passenger3.name, count: 1)
    expect(page).to have_content(passenger4.name, count: 1)
    expect(page).to have_content(passenger5.name, count: 1)
    expect(page).to have_content(passenger6.name, count: 1)
  end
end

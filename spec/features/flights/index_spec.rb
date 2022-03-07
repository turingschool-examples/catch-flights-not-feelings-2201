require 'rails_helper'

RSpec.describe "Flights Index Page" do
  it 'has a list of all flight numbers' do
    a1 = Airline.create!(name: "Frontier")
    a2 = Airline.create!(name: "Southwest")

    f1 = a1.flights.create!(number: 7990, date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas")
    f2 = a1.flights.create!(number: 7354, date: "2/7/2022", departure_city: "Glendale", arrival_city: "Denver")
    f3 = a1.flights.create!(number: 9235, date: "2/8/2022", departure_city: "SLC", arrival_city: "NYC")
    f4 = a2.flights.create!(number: 1625, date: "2/8/2022", departure_city: "SLC", arrival_city: "Philly")
    f5 = a2.flights.create!(number: 9057, date: "2/8/2022", departure_city: "Greenville", arrival_city: "Asheville")

    p1 = Passenger.create!(name: "Jerry", age: 42)
    p2 = Passenger.create!(name: "George", age: 38)
    p3 = Passenger.create!(name: "Elaine", age: 35)
    p4 = Passenger.create!(name: "Kramer", age: 44)
    p5 = Passenger.create!(name: "Charlie", age: 28)
    p6 = Passenger.create!(name: "Dennis", age: 31)
    p7 = Passenger.create!(name: "Dee", age: 33)

    pf1 = PassengerFlight.create!(flight_id: f1.id, passenger_id: p1.id)
    pf2 = PassengerFlight.create!(flight_id: f1.id, passenger_id: p2.id)
    pf3 = PassengerFlight.create!(flight_id: f2.id, passenger_id: p3.id)
    pf4 = PassengerFlight.create!(flight_id: f2.id, passenger_id: p4.id)
    pf5 = PassengerFlight.create!(flight_id: f3.id, passenger_id: p5.id)
    pf6 = PassengerFlight.create!(flight_id: f4.id, passenger_id: p6.id)
    pf7 = PassengerFlight.create!(flight_id: f5.id, passenger_id: p7.id)
  
    visit "/flights"

    expect(page).to have_content(f1.number)
    expect(page).to have_content(f2.number)
    expect(page).to have_content(f3.number)
    expect(page).to have_content(f4.number)
    expect(page).to have_content(f5.number)
  end

  it "displays all passengers on each flight" do
    a1 = Airline.create!(name: "Frontier")
    a2 = Airline.create!(name: "Southwest")

    f1 = a1.flights.create!(number: 7990, date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas")
    f2 = a1.flights.create!(number: 7354, date: "2/7/2022", departure_city: "Glendale", arrival_city: "Denver")
    f3 = a1.flights.create!(number: 9235, date: "2/8/2022", departure_city: "SLC", arrival_city: "NYC")
    f4 = a2.flights.create!(number: 1625, date: "2/8/2022", departure_city: "SLC", arrival_city: "Philly")
    f5 = a2.flights.create!(number: 9057, date: "2/8/2022", departure_city: "Greenville", arrival_city: "Asheville")

    p1 = Passenger.create!(name: "Jerry", age: 42)
    p2 = Passenger.create!(name: "George", age: 38)
    p3 = Passenger.create!(name: "Elaine", age: 35)
    p4 = Passenger.create!(name: "Kramer", age: 44)
    p5 = Passenger.create!(name: "Charlie", age: 28)
    p6 = Passenger.create!(name: "Dennis", age: 31)
    p7 = Passenger.create!(name: "Dee", age: 33)
    p8 = Passenger.create!(name: "Frank", age: 75)

    pf1 = PassengerFlight.create!(flight_id: f1.id, passenger_id: p1.id)
    pf2 = PassengerFlight.create!(flight_id: f1.id, passenger_id: p2.id)
    pf3 = PassengerFlight.create!(flight_id: f2.id, passenger_id: p3.id)
    pf4 = PassengerFlight.create!(flight_id: f2.id, passenger_id: p4.id)
    pf5 = PassengerFlight.create!(flight_id: f3.id, passenger_id: p5.id)
    pf6 = PassengerFlight.create!(flight_id: f4.id, passenger_id: p6.id)
    pf7 = PassengerFlight.create!(flight_id: f5.id, passenger_id: p7.id)
  
    visit "/flights"

    expect(page).to have_content(p1.name)
    expect(page).to have_content(p2.name)
    expect(page).to have_content(p7.name)
    expect(page).to_not have_content(p8.name)
  end

  it 'has Airline name next to flight number' do
    a1 = Airline.create!(name: "Frontier")
    a2 = Airline.create!(name: "Southwest")
    a3 = Airline.create!(name: "Delta")

    f1 = a1.flights.create!(number: 7990, date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas")
    f2 = a1.flights.create!(number: 7354, date: "2/7/2022", departure_city: "Glendale", arrival_city: "Denver")
    f3 = a1.flights.create!(number: 9235, date: "2/8/2022", departure_city: "SLC", arrival_city: "NYC")
    f4 = a2.flights.create!(number: 1625, date: "2/8/2022", departure_city: "SLC", arrival_city: "Philly")
    f5 = a2.flights.create!(number: 9057, date: "2/8/2022", departure_city: "Greenville", arrival_city: "Asheville")

    p1 = Passenger.create!(name: "Jerry", age: 42)
    p2 = Passenger.create!(name: "George", age: 38)
    p3 = Passenger.create!(name: "Elaine", age: 35)
    p4 = Passenger.create!(name: "Kramer", age: 44)
    p5 = Passenger.create!(name: "Charlie", age: 28)
    p6 = Passenger.create!(name: "Dennis", age: 31)
    p7 = Passenger.create!(name: "Dee", age: 33)
    p8 = Passenger.create!(name: "Frank", age: 75)

    pf1 = PassengerFlight.create!(flight_id: f1.id, passenger_id: p1.id)
    pf2 = PassengerFlight.create!(flight_id: f1.id, passenger_id: p2.id)
    pf3 = PassengerFlight.create!(flight_id: f2.id, passenger_id: p3.id)
    pf4 = PassengerFlight.create!(flight_id: f2.id, passenger_id: p4.id)
    pf5 = PassengerFlight.create!(flight_id: f3.id, passenger_id: p5.id)
    pf6 = PassengerFlight.create!(flight_id: f4.id, passenger_id: p6.id)
    pf7 = PassengerFlight.create!(flight_id: f5.id, passenger_id: p7.id)
  
    visit "/flights"

    expect(page).to have_content(a1.name)
    expect(page).to have_content(a2.name)
    expect(page).to_not have_content(a3.name)
  end

  xit 'has a link to remove a passenger' do
    a1 = Airline.create!(name: "Frontier")
    a2 = Airline.create!(name: "Southwest")
    a3 = Airline.create!(name: "Delta")

    f1 = a1.flights.create!(number: 7990, date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas")
    f2 = a1.flights.create!(number: 7354, date: "2/7/2022", departure_city: "Glendale", arrival_city: "Denver")
    f3 = a1.flights.create!(number: 9235, date: "2/8/2022", departure_city: "SLC", arrival_city: "NYC")
    f4 = a2.flights.create!(number: 1625, date: "2/8/2022", departure_city: "SLC", arrival_city: "Philly")
    f5 = a2.flights.create!(number: 9057, date: "2/8/2022", departure_city: "Greenville", arrival_city: "Asheville")

    p1 = Passenger.create!(name: "Jerry", age: 42)
    p2 = Passenger.create!(name: "George", age: 38)
    p3 = Passenger.create!(name: "Elaine", age: 35)
    p4 = Passenger.create!(name: "Kramer", age: 44)
    p5 = Passenger.create!(name: "Charlie", age: 28)
    p6 = Passenger.create!(name: "Dennis", age: 31)
    p7 = Passenger.create!(name: "Dee", age: 33)
    p8 = Passenger.create!(name: "Frank", age: 75)

    pf1 = PassengerFlight.create!(flight_id: f1.id, passenger_id: p1.id)
    pf2 = PassengerFlight.create!(flight_id: f1.id, passenger_id: p2.id)
    pf3 = PassengerFlight.create!(flight_id: f2.id, passenger_id: p3.id)
    pf4 = PassengerFlight.create!(flight_id: f2.id, passenger_id: p4.id)
    pf5 = PassengerFlight.create!(flight_id: f3.id, passenger_id: p5.id)
    pf6 = PassengerFlight.create!(flight_id: f4.id, passenger_id: p6.id)
    pf7 = PassengerFlight.create!(flight_id: f5.id, passenger_id: p7.id)
  
    visit "/flights"

    expect(page).to have_content(p1.name)
    expect(page).to have_content(p2.name)

    click_link "Remove #{p1.name}"

    expect(page).to_not have_content(p1.name)
    expect(page).to have_content(p2.name)
  end
end
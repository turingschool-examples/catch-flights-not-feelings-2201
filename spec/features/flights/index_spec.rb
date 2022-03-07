require 'rails_helper'

RSpec.describe 'flights index page' do
  let!(:airline_1) {Airline.create!(name: "Southwest")}
  let!(:airline_2) {Airline.create!(name: "United")}
  let!(:airline_3) {Airline.create!(name: "American")}

  let!(:flight_1) {airline_1.flights.create!(number: "4415", date: "03/07/2022", departure_city: "Boston", arrival_city: "El Paso")}
  let!(:flight_2) {airline_1.flights.create!(number: "85", date: "03/28/2022", departure_city: "Temucla", arrival_city: "Seattle")}
  let!(:flight_3) {airline_1.flights.create!(number: "399", date: "04/01/2022", departure_city: "Columbus", arrival_city: "Dallas")}
  let!(:flight_4) {airline_1.flights.create!(number: "55", date: "04/15/2022", departure_city: "Portland", arrival_city: "Phoenix")}
  let!(:flight_5) {airline_2.flights.create!(number: "1750", date: "04/15/2022", departure_city: "Santa Fe", arrival_city: "Salt Lake City")}
  let!(:flight_6) {airline_2.flights.create!(number: "655", date: "04/15/2022", departure_city: "Chicago", arrival_city: "Tampa")}
  let!(:flight_7) {airline_3.flights.create!(number: "788", date: "04/15/2022", departure_city: "Las Vegas", arrival_city: "Boise")}

  let!(:passenger_1) {Passenger.create!(name: "Terry Crews", age: 54)}
  let!(:passenger_2) {Passenger.create!(name: "Billy McFarland", age: 38)}
  let!(:passenger_3) {Passenger.create!(name: "Carl Weathers", age: 64)}
  let!(:passenger_4) {Passenger.create!(name: "Jerry Seinfeld", age: 62)}
  let!(:passenger_5) {Passenger.create!(name: "Henry Kissenger", age: 88)}
  let!(:passenger_6) {Passenger.create!(name: "Dave Chappelle", age: 52)}
  let!(:passenger_7) {Passenger.create!(name: "Fred Durst", age: 58)}

  let!(:flight_passenger_1) {FlightPassenger.create!(passenger_id: passenger_1.id, flight_id: flight_1.id)}
  let!(:flight_passenger_2) {FlightPassenger.create!(passenger_id: passenger_2.id, flight_id: flight_2.id)}
  let!(:flight_passenger_3) {FlightPassenger.create!(passenger_id: passenger_3.id, flight_id: flight_3.id)}
  let!(:flight_passenger_4) {FlightPassenger.create!(passenger_id: passenger_4.id, flight_id: flight_4.id)}
  let!(:flight_passenger_5) {FlightPassenger.create!(passenger_id: passenger_5.id, flight_id: flight_5.id)}
  let!(:flight_passenger_6) {FlightPassenger.create!(passenger_id: passenger_6.id, flight_id: flight_6.id)}
  let!(:flight_passenger_7) {FlightPassenger.create!(passenger_id: passenger_7.id, flight_id: flight_7.id)}

  it "can see a list of all flight numbers" do
    visit "/flights"

    expect(page).to have_content(flight_1.number)
    expect(page).to have_content(flight_2.number)
    expect(page).to have_content(flight_3.number)
  end

  it 'lists the airline number for the flight' do
     visit "/flights"

     within 'flight_001'
     expect(page).to have_content("Airline: #{flight_1.airline.name}")

     within 'flight_002'
     expect(page).to have_content("Airline: #{flight_2.airline.name}")

     within 'flight_003'
     expect(page).to have_content("Airline: #{flight_3.airline.name}")

     within 'flight_004'
     expect(page).to have_content("Airline: #{flight_4.airline.name}")

     within 'flight_005'
     expect(page).to have_content("Airline: #{flight_5.airline.name}")
   end
 end

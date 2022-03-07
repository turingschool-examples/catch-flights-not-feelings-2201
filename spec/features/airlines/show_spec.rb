require 'rails_helper'

RSpec.describe 'airline show page' do
  let!(:southwest) {Airline.create!(name: 'Southwest Arlines')}
  let!(:united) {Airline.create!(name: 'United Airlines')}

  let!(:flight_1) {southwest.flights.create!(number: '1234', date: '12/23/21', departure_city: 'Denver', arrival_city: 'Honolulu', airline_id: southwest.id)}
  let!(:flight_2) {southwest.flights.create!(number: '1235', date: '12/24/21', departure_city: 'Denver', arrival_city: 'Phoenix', airline_id: southwest.id)}
  let!(:flight_3) {southwest.flights.create!(number: '1236', date: '1/2/22', departure_city: 'Denver', arrival_city: 'Minneapolis', airline_id: southwest.id)}
  let!(:flight_4) {united.flights.create!(number: '1237', date: '1/3/22', departure_city: 'Denver', arrival_city: 'New York City', airline_id: united.id)}

  let!(:meghan) {flight_1.passengers.create!(name: 'Meghan Trainor', age: 35)}
  let!(:bob) {flight_1.passengers.create!(name: 'Bob Vance', age: 15)}
  let!(:phyllis) {flight_2.passengers.create!(name: 'Phyllis Vance', age: 17)}
  let!(:michael) {flight_2.passengers.create!(name: 'Michael Scott', age: 35)}
  let!(:holly) {flight_3.passengers.create!(name: 'Holly Flax', age: 15)}
  let!(:pam) {flight_3.passengers.create!(name: 'Pam Halpert', age: 35)}
  let!(:pam2) {flight_3.passengers.create!(name: 'Pam Halpert', age: 35)}
  let!(:jim) {flight_4.passengers.create!(name: 'Jim Halpert', age: 35)}

  let!(:passenger_flight_1) {PassengerFlight.create!(flight_id: flight_1.id, passenger_id: meghan.id)}
  let!(:passenger_flight_2) {PassengerFlight.create!(flight_id: flight_1.id, passenger_id: bob.id)}
  let!(:passenger_flight_3) {PassengerFlight.create!(flight_id: flight_2.id, passenger_id: phyllis.id)}
  let!(:passenger_flight_4) {PassengerFlight.create!(flight_id: flight_2.id, passenger_id: michael.id)}
  let!(:passenger_flight_5) {PassengerFlight.create!(flight_id: flight_3.id, passenger_id: holly.id)}
  let!(:passenger_flight_6) {PassengerFlight.create!(flight_id: flight_3.id, passenger_id: pam.id)}
  let!(:passenger_flight_6) {PassengerFlight.create!(flight_id: flight_3.id, passenger_id: pam2.id)}
  let!(:passenger_flight_7) {PassengerFlight.create!(flight_id: flight_4.id, passenger_id: jim.id)}

  before(:each) do
    visit airline_path(southwest.id)
  end
  it 'shows list of unique adult passengers with flights on that airline' do
    expect(page).to have_content(meghan.name)
    expect(page).to have_content(michael.name)
    expect(page).to have_content(pam.name)
    expect(page).to_not have_content(bob.name)
    expect(page).to_not have_content(jim.name)
  end
end
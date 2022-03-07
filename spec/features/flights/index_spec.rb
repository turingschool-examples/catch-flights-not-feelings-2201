require 'rails_helper'

RSpec.describe 'flight index page' do
  let!(:southwest) {Airline.create!(name: 'Southwest Arlines')}
  let!(:united) {Airline.create!(name: 'United Airlines')}

  let!(:flight_1) {southwest.flights.create!(number: '1234', date: '12/23/21', departure_city: 'Denver', arrival_city: 'Honolulu', airline_id: southwest.id)}
  let!(:flight_2) {southwest.flights.create!(number: '1235', date: '12/24/21', departure_city: 'Denver', arrival_city: 'Phoenix', airline_id: southwest.id)}
  let!(:flight_3) {southwest.flights.create!(number: '1236', date: '1/2/22', departure_city: 'Denver', arrival_city: 'Minneapolis', airline_id: southwest.id)}
  let!(:flight_4) {united.flights.create!(number: '1237', date: '1/3/22', departure_city: 'Denver', arrival_city: 'New York City', airline_id: united.id)}
  let!(:flight_5) {united.flights.create!(number: '1238', date: '1/4/22', departure_city: 'Denver', arrival_city: 'Los Angeles', airline_id: united.id)}

  let!(:meghan) {flight_1.passengers.create!(name: 'Meghan Trainor', age: 35)}
  let!(:bob) {flight_1.passengers.create!(name: 'Bob Vance', age: 35)}
  let!(:phyllis) {flight_2.passengers.create!(name: 'Phyllis Vance', age: 35)}
  let!(:michael) {flight_2.passengers.create!(name: 'Michael Scott', age: 35)}
  let!(:holly) {flight_3.passengers.create!(name: 'Holly Flax', age: 35)}
  let!(:pam) {flight_3.passengers.create!(name: 'Pam Halpert', age: 35)}
  let!(:jim) {flight_4.passengers.create!(name: 'Jim Halpert', age: 35)}
  let!(:angela) {flight_4.passengers.create!(name: 'Angela Martin', age: 35)}
  let!(:dwight) {flight_5.passengers.create!(name: 'Dwight Schrute', age: 35)}
  let!(:toby) {flight_5.passengers.create!(name: 'Toby Flenderson', age: 35)}

  # let!(:passenger_flight_1) {PassengerFlight.create!(flight_id: flight_1.id, passenger_id: meghan.id)}
  # let!(:passenger_flight_2) {PassengerFlight.create!(flight_id: flight_1.id, passenger_id: bob.id)}
  # let!(:passenger_flight_3) {PassengerFlight.create!(flight_id: flight_2.id, passenger_id: phyllis.id)}
  # let!(:passenger_flight_4) {PassengerFlight.create!(flight_id: flight_2.id, passenger_id: michael.id)}
  # let!(:passenger_flight_5) {PassengerFlight.create!(flight_id: flight_3.id, passenger_id: holly.id)}
  # let!(:passenger_flight_6) {PassengerFlight.create!(flight_id: flight_3.id, passenger_id: pam.id)}
  # let!(:passenger_flight_7) {PassengerFlight.create!(flight_id: flight_4.id, passenger_id: jim.id)}
  # let!(:passenger_flight_8) {PassengerFlight.create!(flight_id: flight_4.id, passenger_id: angela.id)}
  # let!(:passenger_flight_9) {PassengerFlight.create!(flight_id: flight_5.id, passenger_id: dwight.id)}
  # let!(:passenger_flight_9) {PassengerFlight.create!(flight_id: flight_5.id, passenger_id: toby.id)}

  before(:each) do
    visit flights_path
  end
  
  it 'shows a list of all flight numbers' do
    expect(page).to have_content(flight_1.number)
    expect(page).to have_content(flight_2.number)
    expect(page).to have_content(flight_3.number)
    expect(page).to have_content(flight_4.number)
    expect(page).to have_content(flight_5.number)
  end

  it 'shows name of airline with flight number' do
    expect(page).to have_content(southwest.name)
    expect(page).to have_content(united.name)
  end

  it 'shows names of all flight passengers under each flight number' do
    within("#1234") do
      expect(page).to have_content(meghan.name)
      expect(page).to have_content(bob.name)
    end 

    within("#1235") do
      expect(page).to have_content(phyllis.name)
      expect(page).to have_content(michael.name)
    end

    within("#1236") do
      expect(page).to have_content(holly.name)
      expect(page).to have_content(pam.name)
    end

    within("#1237") do
      expect(page).to have_content(jim.name)
      expect(page).to have_content(angela.name)
    end

    within("#1238") do
      expect(page).to have_content(dwight.name)
      expect(page).to have_content(toby.name)
    end
  end

  it 'includes a button to remove passenger from flight' do
    within("#1234") do
      expect(page).to have_button("Remove #{meghan.name}")
      click_button("Remove #{meghan.name}")
      expect(page).to_not have_content(meghan.name)
      expect(page).to have_content(bob.name)
    end
    expect(current_path).to eq(flights_path)
  end
end
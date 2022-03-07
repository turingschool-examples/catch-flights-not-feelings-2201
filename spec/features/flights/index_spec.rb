require 'rails_helper'

RSpec.describe 'flight index page' do
  before(:each) do
    @southwest = Airline.create!(name: 'Southwest')
    @united = Airline.create!(name: 'United Airlines')

    @flight_1 = @southwest.flights.create!(number: '1234', date: '12/23/21', departure_city: 'Denver', arrival_city: 'Honolulu', airline_id: @southwest.id)
    @flight_2 = @southwest.flights.create!(number: '1235', date: '12/24/21', departure_city: 'Denver', arrival_city: 'Phoenix', airline_id: @southwest.id)
    @flight_3 = @southwest.flights.create!(number: '1236', date: '1/2/22', departure_city: 'Denver', arrival_city: 'Minneapolis', airline_id: @southwest.id)
    @flight_4 = @united.flights.create!(number: '1237', date: '1/3/22', departure_city: 'Denver', arrival_city: 'New York City', airline_id: @united.id)
    @flight_5 = @united.flights.create!(number: '1238', date: '1/4/22', departure_city: 'Denver', arrival_city: 'Los Angeles', airline_id: @united.id)

    @meghan = @flight_1.passengers.create!(name: 'Meghan Trainor', age: 35)
    @bob = @flight_1.passengers.create!(name: 'Bob Vance', age: 35)
    @phyllis = @flight_2.passengers.create!(name: 'Phyllis Vance', age: 35)
    @michael = @flight_2.passengers.create!(name: 'Michael Scott', age: 35)
    @holly = @flight_3.passengers.create!(name: 'Holly Flax', age: 35)
    @pam = @flight_3.passengers.create!(name: 'Pam Halpert', age: 35)
    @jim = @flight_4.passengers.create!(name: 'Jim Halpert', age: 35)
    @angela = @flight_4.passengers.create!(name: 'Angela Martin', age: 35)
    @dwight = @flight_5.passengers.create!(name: 'Dwight Schrute', age: 35)
    @toby = @flight_5.passengers.create!(name: 'Toby Flenderson', age: 35)

    @passenger_flight_1 = PassengerFlight.create!(@flight_1.id, @meghan.id)
    @passenger_flight_2 = PassengerFlight.create!(@flight_1.id, @bob.id)
    @passenger_flight_3 = PassengerFlight.create!(@flight_2.id, @phyllis.id)
    @passenger_flight_4 = PassengerFlight.create!(@flight_2.id, @michael.id)
    @passenger_flight_5 = PassengerFlight.create!(@flight_3.id, @holly.id)
    @passenger_flight_6 = PassengerFlight.create!(@flight_3.id, @pam.id)
    @passenger_flight_7 = PassengerFlight.create!(@flight_4.id, @jim.id)
    @passenger_flight_8 = PassengerFlight.create!(@flight_4.id, @angela.id)
    @passenger_flight_9 = PassengerFlight.create!(@flight_5.id, @dwight.id)
    @passenger_flight_9 = PassengerFlight.create!(@flight_5.id, @toby.id)

    visit flights_path
  end
  
  it 'shows a list of all flight numbers' do
    expect(page).to have_content(@flight_1.number)
    expect(page).to have_content(@flight_2.number)
    expect(page).to have_content(@flight_3.number)
    expect(page).to have_content(@flight_4.number)
    expect(page).to have_content(@flight_5.number)
  end

  it 'shows name of airline next to each flight number' do
    
    
  end

  it 'shows names of all flights passengers under each flight number' do
    
  end
end
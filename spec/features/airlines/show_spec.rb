require 'rails_helper'
describe 'flights index page' do
  before :each do

    @airline_1 = Airline.create!(name: 'Spirit')

    @flight_1 = @airline_1.flights.create!(number: '1', date: '3/7/22', departure_city: 'Richmond', arrival_city: 'Denver')

    @passenger_1 = Passenger.create!(name: 'Teddy', age: 1)
    @passenger_2 = Passenger.create!(name: 'Max', age: 28)

    @flight_passenger_1 = FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @passenger_1.id)
    @flight_passenger_2 = FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @passenger_2.id)

    @airline_2 = Airline.create!(name: 'Delta')

    @flight_2 = @airline_2.flights.create!(number: '2', date: '3/8/22', departure_city: 'DC', arrival_city: 'LA')

    @passenger_3 = Passenger.create!(name: 'Alice', age: 2)
    @passenger_4 = Passenger.create!(name: 'Maggie', age: 29)

    @flight_passenger_3 = FlightPassenger.create!(flight_id: @flight_2.id, passenger_id: @passenger_3.id)
    @flight_passenger_4 = FlightPassenger.create!(flight_id: @flight_2.id, passenger_id: @passenger_4.id)

    @passenger_5 = Passenger.create!(name: 'Martin', age: 55)
    visit "/airlines/#{@airline_1.id}"
  end
  it 'I see a unique list of adult passengers that have flights on that airline' do
    expect(page).to have_content("#{@passenger_2.name}")
    expect(page).to have_content("#{@passenger_4.name}")
    expect(page).to_not have_content("#{@passenger_1.name}")
    expect(page).to_not have_content("#{@passenger_3.name}")
    expect(page).to_not have_content("#{@passenger_5.name}")
  end
end

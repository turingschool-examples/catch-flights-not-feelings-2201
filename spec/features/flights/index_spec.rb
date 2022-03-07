require 'rails_helper'

RSpec.describe "Flight Index Page" do
  before(:each) do
    @airline = Airline.create!(name: "Delta Airlines")
    @airline_2 = Airline.create!(name: "Southwest Airlines")

    @flight = @airline.flights.create!(number: 1395, date: "03/9/2022", departure_city: "Washington", arrival_city: "Powell")

    @flight_2 = @airline_2.flights.create!(number: 1396, date: "03/20/2022", departure_city: "Denver", arrival_city: "Chicago")
    @flight_3 = @airline_2.flights.create!(number: 1397, date: "03/22/2022", departure_city: "Denver", arrival_city: "St. Louis")

    @passenger = @flight.passengers.create!(name: "Joey", age: 20)
    @passenger_2 = @flight.passengers.create!(name: "Little Joey", age: 16)

    @passenger_3 = @flight_2.passengers.create!(name: "Hubert", age: 21)

    @passenger_4 = @flight_3.passengers.create!(name: "John", age: 30)
    @passenger_5 = @flight_3.passengers.create!(name: "Mark", age: 25)
    @passenger_6 = @flight_3.passengers.create!(name: "Spencer", age: 12)
  end

  it 'Displays all flight numbers' do
    expect(page).to have_content(@flight.number)
    expect(page).to have_content(@flight_2.number)
    expect(page).to have_content(@flight_3.number)
  end
end

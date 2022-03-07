require 'rails_helper'

RSpec.describe 'flight_passengers#destroy' do
  before(:each) do
    @airline = Airline.create!(name: "Delta Airlines")

    @flight = @airline.flights.create!(number: 1395, date: "03/9/2022", departure_city: "Washington", arrival_city: "Powell")

    @passenger = @flight.passengers.create!(name: "Joey", age: 20)
    @passenger_2 = @flight.passengers.create!(name: "Little Joey", age: 16)
  end

  it 'can delete a given passenger from a flight' do
    visit "/flights"

    click_button("Remove #{@passenger_2.name}")

    expect(current_path).to eq("/flights")
    expect(page).to_not have_content("Little Joey")
  end
end

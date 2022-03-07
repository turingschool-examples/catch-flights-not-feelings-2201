require 'rails_helper'

RSpec.describe 'Airline Show Page' do
  before :each do
    @airline_1 = Airline.create!(name: "Southwest")
    @airline_2 = Airline.create!(name: "United")

    @flight_1 = @airline_1.flights.create!(number: 7946, date: "01/01/22", departure_city: "Denver", arrival_city: "Los Angeles" )
    @flight_2 = @airline_1.flights.create!(number: 1346, date: "02/02/22", departure_city: "New York", arrival_city: "Austin" )

    @passenger_1 = @flight_1.passengers.create!(name: "Randy Smith", age: 25 )
    @passenger_2 = @flight_1.passengers.create!(name: "Tina Belcher", age: 20 )

    @passenger_3 = @flight_2.passengers.create!(name: "Big Bob", age: 40 )
    @passenger_4 = @flight_2.passengers.create!(name: "Little Bob", age: 15 )

    @flight_3 = @airline_2.flights.create!(number: 9665, date: "10/12/22", departure_city: "Chicago", arrival_city: "New Orleans" )
    @flight_4 = @airline_2.flights.create!(number: 6798, date: "11/09/22", departure_city: "Dallas", arrival_city: "San Francisco" )

    @passenger_5 = @flight_3.passengers.create!(name: "Rob Newman", age: 33 )
    @passenger_6 = @flight_3.passengers.create!(name: "Steve Corell", age: 17 )

    @passenger_7 = @flight_4.passengers.create!(name: "Jim Carrey", age: 49 )
    @passenger_8 = @flight_4.passengers.create!(name: "Chadwick Bosman", age: 28 )
  end

  it "Shows Passengers on a flight in that airline" do
    duplicate = PassengerFlight.create!(passenger_id: @passenger_3.id, flight_id: @flight_1.id)

    visit "/airlines/#{@airline_1.id}"

    within ".passengers" do
      expect(page).to have_content("#{@passenger_1.name}")
      expect(page).to have_content("#{@passenger_2.name}")
      expect(page).to have_content("#{@passenger_3.name}")
      expect(page).to_not have_content("#{@passenger_4.name}")

      expect(page).to_not have_content("#{@passenger_5.name}")
    end
  end
end

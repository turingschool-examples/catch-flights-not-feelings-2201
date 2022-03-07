require 'rails_helper'

RSpec.describe 'Flights Index Page' do
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

  it "shows flights attributes" do
    visit "/flights"

    within ".flight_attributes" do
      expect(page).to have_content("#{@flight_1.number}")
      expect(page).to have_content("#{@airline_1.name}")
      expect(page).to have_content("#{@passenger_1.name}")
      expect(page).to have_content("#{@passenger_2.name}")

      expect(page).to have_content("#{@flight_2.number}")
      expect(page).to have_content("#{@airline_1.name}")
      expect(page).to have_content("#{@passenger_3.name}")
      expect(page).to have_content("#{@passenger_4.name}")

      expect(page).to have_content("#{@flight_3.number}")
      expect(page).to have_content("#{@airline_2.name}")
      expect(page).to have_content("#{@passenger_5.name}")
      expect(page).to have_content("#{@passenger_6.name}")

      expect(page).to have_content("#{@flight_4.number}")
      expect(page).to have_content("#{@airline_2.name}")
      expect(page).to have_content("#{@passenger_7.name}")
      expect(page).to have_content("#{@passenger_8.name}")
    end
  end

  it "can remove a passenger" do
    visit "/flights"

    within ".flight_attributes" do
      click_link("Remove #{@passenger_1.name}")
    end

    expect(current_path).to eq("/flights")

    expect(page).to_not have_content("#{@passenger_1.name}")
  end
end

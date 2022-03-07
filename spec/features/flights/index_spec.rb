require 'rails_helper'

RSpec.describe "Flights Index" do
  before :each do
    @airline1 = Airline.create!(name: "American")
    @airline2 = Airline.create!(name: "Delta")
    @airline3 = Airline.create!(name: "JetBlue")
    @airline4 = Airline.create!(name: "Southwest")
    @airline5 = Airline.create!(name: "United")

    @flight1 = Flight.create!(number: 7990, date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas", airline: @airline1)
    @flight2 = Flight.create!(number: 3940, date: "3/10/2022", departure_city: "Detroit", arrival_city: "Orlando", airline: @airline2)
    @flight3 = Flight.create!(number: 9091, date: "5/17/2022", departure_city: "Chicago", arrival_city: "Kansas City", airline: @airline3)
    @flight4 = Flight.create!(number: 6798, date: "10/9/2022", departure_city: "Tulsa", arrival_city: "Fresno", airline: @airline4)
    @flight5 = Flight.create!(number: 9665, date: "11/22/2022", departure_city: "Durham", arrival_city: "New Orleans", airline: @airline5)

    @passenger1 = Passenger.create!(name: "Tina Belcher", age: 13)
    @passenger2 = Passenger.create!(name: "Louise Belcher", age: 9)
    @passenger3 = Passenger.create!(name: "Bob Belcher", age: 46)
    @passenger4 = Passenger.create!(name: "Linda Belcher", age: 44)
    @passenger5 = Passenger.create!(name: "Big Bob", age: 84)

    FlightPassenger.create!(passenger: @passenger1, flight: @flight1)
    FlightPassenger.create!(passenger: @passenger2, flight: @flight1)
    FlightPassenger.create!(passenger: @passenger3, flight: @flight2)
    FlightPassenger.create!(passenger: @passenger4, flight: @flight2)
    FlightPassenger.create!(passenger: @passenger5, flight: @flight3)
    FlightPassenger.create!(passenger: @passenger1, flight: @flight3)
    FlightPassenger.create!(passenger: @passenger2, flight: @flight4)
    FlightPassenger.create!(passenger: @passenger3, flight: @flight4)
    FlightPassenger.create!(passenger: @passenger4, flight: @flight5)
    FlightPassenger.create!(passenger: @passenger5, flight: @flight5)

    visit '/flights'
  end

  it 'shows a list of all flight numbers' do

    expect(page).to have_content(@flight1.number)
    expect(page).to have_content(@flight2.number)
    expect(page).to have_content(@flight3.number)
    expect(page).to have_content(@flight4.number)
    expect(page).to have_content(@flight5.number)
  end

  it 'shows airline name of flight' do
    within("#flight-#{@flight1.id}") do
      expect(page).to have_content(@airline1.name)
      expect(page).to_not have_content(@airline2.name)
    end

    within("#flight-#{@flight2.id}") do
      expect(page).to have_content(@airline2.name)
      expect(page).to_not have_content(@airline3.name)
    end
  end

  it 'lists all passengers of flight' do
    within("#flight-#{@flight1.id}") do
      expect(page).to have_content(@passenger1.name)
      expect(page).to have_content(@passenger2.name)
      expect(page).to_not have_content(@passenger3.name)
    end

    within("#flight-#{@flight2.id}") do
      expect(page).to have_content(@passenger3.name)
      expect(page).to have_content(@passenger4.name)
      expect(page).to_not have_content(@passenger5.name)
    end
  end

  it 'shows remove passenger button' do
    within("#passenger-#{@flight1.id}-#{@passenger1.id}") do
      expect(page).to have_button("Remove")
    end
  end

  it 'removes passenger' do
    within("#passenger-#{@flight1.id}-#{@passenger1.id}") do
      click_button("Remove")
    end

    expect(current_path).to eq("/flights")

    within("#flight-#{@flight1.id}") do
      expect(page).to_not have_content(@passenger1.name)
    end
  end
end

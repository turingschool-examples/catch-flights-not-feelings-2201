require 'rails_helper'

RSpec.describe 'airlines show' do 
  before(:each) do 
    @airline1 = Airline.create!(name: "Southwest")

    @flight1 = Flight.create!(number: 7990, date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas", airline: @airline1)
    @flight2 = Flight.create!(number: 3940, date: "3/10/2022", departure_city: "Detroit", arrival_city: "Orlando", airline: @airline1)
    @flight3 = Flight.create!(number: 9091, date: "5/17/2022", departure_city: "Chicago", arrival_city: "Kansas City", airline: @airline1)
    @flight4 = Flight.create!(number: 6798, date: "10/9/2022", departure_city: "Tulsa", arrival_city: "Fresno", airline: @airline1)
    @flight5 = Flight.create!(number: 9665, date: "11/22/2022", departure_city: "Durham", arrival_city: "New Orleans", airline: @airline1)

    @passenger1 = Passenger.create!(name: "Tina Belcher", age: 13)
    @passenger2 = Passenger.create!(name: "Louise Belcher", age: 9)
    @passenger3 = Passenger.create!(name: "Bob Belcher", age: 46)
    @passenger4 = Passenger.create!(name: "Linda Belcher", age: 44)
    @passenger5 = Passenger.create!(name: "Big Bob", age: 84)

    @fp1 = FlightPassenger.create!(flight: @flight1, passenger: @passenger1)
    @fp2 = FlightPassenger.create!(flight: @flight1, passenger: @passenger2)
    @fp2 = FlightPassenger.create!(flight: @flight1, passenger: @passenger3)
    @fp2 = FlightPassenger.create!(flight: @flight1, passenger: @passenger4)
    @fp3 = FlightPassenger.create!(flight: @flight2, passenger: @passenger3)
    @fp4 = FlightPassenger.create!(flight: @flight2, passenger: @passenger4)
    @fp5 = FlightPassenger.create!(flight: @flight3, passenger: @passenger4)
    @fp6 = FlightPassenger.create!(flight: @flight4, passenger: @passenger3)
    @fp6 = FlightPassenger.create!(flight: @flight4, passenger: @passenger4)
    @fp6 = FlightPassenger.create!(flight: @flight4, passenger: @passenger5)
    @fp7 = FlightPassenger.create!(flight: @flight5, passenger: @passenger4)
    @fp7 = FlightPassenger.create!(flight: @flight5, passenger: @passenger5)
    visit airline_path(@airline1)
  end
  it 'has list of passengers that have flights on airline' do 
    expect(page).to have_content(@passenger3.name)
    expect(page).to have_content(@passenger4.name)
    expect(page).to have_content(@passenger5.name)
  end
  it 'list of passengers is unique without duplicates' do 
    expect(page).to have_content(@passenger3.name, count: 1)
    expect(page).to have_content(@passenger4.name, count: 1)
    expect(page).to have_content(@passenger5.name, count: 1)
  end
  it 'list only includes adult passengers' do
     expect(page).to_not have_content(@passenger1.name)
     expect(page).to_not have_content(@passenger2.name)
  end
  describe 'frequent flyers' do 
    it 'list of passengers is sorted by number of flights each passenger has taken on airline' do 
      expect(@passenger4.name).to appear_before(@passenger3.name)
      expect(@passenger4.name).to appear_before(@passenger5.name)
      expect(@passenger3.name).to appear_before(@passenger5.name)
      expect(@passenger5.name).to_not appear_before(@passenger3.name)
      expect(@passenger5.name).to_not appear_before(@passenger4.name)
    end
  end
end 
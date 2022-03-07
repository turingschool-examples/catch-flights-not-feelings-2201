require 'rails_helper'

RSpec.describe Airline, type: :model do
  it { should have_many :flights }

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
  end
  
  describe 'instance methods' do 
    describe '.passenger_list' do 
      it 'returns a UNIQUE list of passengers that are 18 or over and orders list by number of flights' do 
        passenger_list = @airline1.passenger_list.map { |passenger| [passenger.name, passenger.age, passenger.count] }
        expect(passenger_list).to eq([["Linda Belcher", 44, 5], ["Bob Belcher", 46, 3], ["Big Bob", 84, 2]])
      end
    end
  end
end
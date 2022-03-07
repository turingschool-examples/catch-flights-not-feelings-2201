require 'rails_helper'

RSpec.describe FlightPassenger, type: :model do
  it { should belong_to :flight }
  it { should belong_to :passenger }

  before(:each) do 
    @airline1 = Airline.create!(name: "American")
    @airline2 = Airline.create!(name: "Delta")
    @airline3 = Airline.create!(name: "JetBlue")
    @airline4 = Airline.create!(name: "Southwest")
    @airline5 = Airline.create!(name: "United")

    @flight1 = Flight.create!(id: 1, number: 7990, date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas", airline: @airline1)
    @flight2 = Flight.create!(id: 2, number: 3940, date: "3/10/2022", departure_city: "Detroit", arrival_city: "Orlando", airline: @airline1)
    @flight3 = Flight.create!(id: 3, number: 9091, date: "5/17/2022", departure_city: "Chicago", arrival_city: "Kansas City", airline: @airline2)
    @flight4 = Flight.create!(id: 4, number: 6798, date: "10/9/2022", departure_city: "Tulsa", arrival_city: "Fresno", airline: @airline2)
    @flight5 = Flight.create!(id: 5, number: 9665, date: "11/22/2022", departure_city: "Durham", arrival_city: "New Orleans", airline: @airline3)

    @passenger1 = Passenger.create!(id: 11, name: "Tina Belcher", age: 13)
    @passenger2 = Passenger.create!(id: 12, name: "Louise Belcher", age: 9)
    @passenger3 = Passenger.create!(id: 13, name: "Bob Belcher", age: 46)
    @passenger4 = Passenger.create!(id: 14, name: "Linda Belcher", age: 44)
    @passenger5 = Passenger.create!(id: 15, name: "Big Bob", age: 84)

    @fp1 = FlightPassenger.create!(flight: @flight1, passenger: @passenger1)
    @fp2 = FlightPassenger.create!(flight: @flight1, passenger: @passenger2)
    @fp3 = FlightPassenger.create!(flight: @flight2, passenger: @passenger1)
    @fp4 = FlightPassenger.create!(flight: @flight2, passenger: @passenger3)
    @fp5 = FlightPassenger.create!(flight: @flight3, passenger: @passenger4)
    @fp6 = FlightPassenger.create!(flight: @flight4, passenger: @passenger4)
    @fp7 = FlightPassenger.create!(flight: @flight5, passenger: @passenger5)
  end

  describe 'class methods' do 
    describe '#find_record(flight_id, passenger_id)' do 
      it 'finds flight_passenger with ids passed through args' do 
        expect(FlightPassenger.find_record(1, 11)).to eq(@fp1)
        expect(FlightPassenger.find_record(1, 12)).to eq(@fp2)
        expect(FlightPassenger.find_record(5, 15)).to eq(@fp7)
      end
    end
  end
end
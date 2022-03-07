require 'rails_helper'

RSpec.describe Airline, type: :model do
  describe 'relationships' do 
    it { should have_many :flights }
    it {should have_many(:flight_passengers).through(:flights)}
    it {should have_many(:passengers).through(:flight_passengers)}
  end 
 
  describe 'instance methods' do 
    describe '.adult_passengers' do 
      it 'returns all adult passengers for a given airline' do 
        FlightPassenger.destroy_all
        Passenger.destroy_all
        american = Airline.create!(name: "American")
        flight1 = Flight.create!(number: 7990, date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas", airline_id: american.id)
        flight2 = Flight.create!(number: 3940, date: "3/10/2022", departure_city: "Detriot", arrival_city: "Orlando", airline_id: american.id)
        flight3 = Flight.create!(number: 9091, date: "5/17/2022", departure_city: "Chicago", arrival_city: "Kansas City", airline_id: american.id)
        passenger1 = Passenger.create!(name: "Tina", age: 15)
        passenger2 = Passenger.create!(name: "Linda", age: 43)
        passenger3 = Passenger.create!(name: "Louise", age: 12)
        passenger4 = Passenger.create!(name: "Bob", age: 44)
        joins1 = FlightPassenger.create!(flight_id: flight1.id, passenger_id: passenger1.id)
        joins2 = FlightPassenger.create!(flight_id: flight2.id, passenger_id: passenger2.id)
        joins3 = FlightPassenger.create!(flight_id: flight3.id, passenger_id: passenger3.id)
        joins4 = FlightPassenger.create!(flight_id: flight1.id, passenger_id: passenger4.id)
        expect(american.adult_passengers).to eq([passenger2, passenger4])
      end 
    end 
  end 

end
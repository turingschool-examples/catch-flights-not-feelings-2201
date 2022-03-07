require 'rails_helper'

RSpec.describe Airline, type: :model do
  describe 'relationships' do
    it { should have_many :flights }
    it { should have_many(:passengers).through(:flights) }
  end

  describe 'instance methods' do
    describe '.list_adult_passengers' do
      it "lists all adult passengers who are on an airlines flights" do
        @airline1 = Airline.create!(name: "Southwest")
        @flight1 = @airline1.flights.create!(number: 123,
                                            date: "12/12/21",
                                            departure_city: "DEN",
                                            arrival_city: "SJC")
        @flight2 = @airline1.flights.create!(number: 586,
                                            date: "12/24/21",
                                            departure_city: "SFO",
                                            arrival_city: "ELP")
        @flight3 = @airline1.flights.create!(number: 842,
                                            date: "12/29/21",
                                            departure_city: "SAC",
                                            arrival_city: "PHX")
        @passenger1 = Passenger.create!(name: "Cole", age: 36)
        @passenger2 = Passenger.create!(name: "Kendra", age: 35)
        @passenger3 = Passenger.create!(name: "Landon", age: 12)
        @passenger4 = Passenger.create!(name: "Tim", age: 45)
        @flight_passenger1 = FlightPassenger.create!(passenger_id: @passenger1.id,
                                                    flight_id: @flight1.id)
        @flight_passenger2 = FlightPassenger.create!(passenger_id: @passenger2.id,
                                                    flight_id: @flight1.id)
        @flight_passenger3 = FlightPassenger.create!(passenger_id: @passenger3.id,
                                                    flight_id: @flight2.id)
        @flight_passenger4 = FlightPassenger.create!(passenger_id: @passenger4.id,
                                                    flight_id: @flight2.id)
        @flight_passenger5 = FlightPassenger.create!(passenger_id: @passenger4.id,
                                                    flight_id: @flight3.id)

        expected = [@passenger1, @passenger2, @passenger4]
        expect(@airline1.list_adult_passengers).to eq(expected)
      end
    end
  end
end

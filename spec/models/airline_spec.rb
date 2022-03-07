require 'rails_helper'

RSpec.describe Airline, type: :model do
  it { should have_many :flights }
  it { should have_many(:passengers).through(:flights) }

  describe 'instance methods' do

    it '#adult_passengers lists passengers age 18+' do

      @airline_1 = Airline.create!(name: 'Spirit')

      @flight_1 = @airline_1.flights.create!(number: '1', date: '3/7/22', departure_city: 'Richmond', arrival_city: 'Denver')

      @passenger_1 = Passenger.create!(name: 'Teddy', age: 1)
      @passenger_2 = Passenger.create!(name: 'Max', age: 28)

      @flight_passenger_1 = FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @passenger_1.id)
      @flight_passenger_2 = FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @passenger_2.id)
      @airline_2 = Airline.create!(name: 'Delta')

      @flight_2 = @airline_1.flights.create!(number: '2', date: '3/8/22', departure_city: 'DC', arrival_city: 'LA')

      @passenger_3 = Passenger.create!(name: 'Alice', age: 2)
      @passenger_4 = Passenger.create!(name: 'Maggie', age: 29)

      @flight_passenger_3 = FlightPassenger.create!(flight_id: @flight_2.id, passenger_id: @passenger_3.id)
      @flight_passenger_4 = FlightPassenger.create!(flight_id: @flight_2.id, passenger_id: @passenger_4.id)

      @passenger_5 = Passenger.create!(name: 'Martin', age: 55)


      expect(@airline_1.adult_passengers).to eq([@passenger_2, @passenger_4])

    end
  end
end

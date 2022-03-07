require 'rails_helper'

RSpec.describe Airline, type: :model do
  it { should have_many :flights }
  it {should have_many(:passengers).through(:flights)}

  describe 'instance methods' do
    before(:each) do
      @air_1 = Airline.create!(name: 'Southwest')
      @air_2 = Airline.create!(name: 'Delta')
      @air_3 = Airline.create!(name: 'Jetblue')

      @flight_1 = @air_1.flights.create!(number: "001",
                                      date: '1/10/22',
                                      departure_city: 'Providence',
                                      arrival_city: 'Denver')
      @flight_2 = @air_2.flights.create!(number: "002",
                                      date: '2/11/22',
                                      departure_city: 'Tampa',
                                      arrival_city: 'Denver')
      @flight_3 = @air_3.flights.create!(number: "003",
                                      date: '3/12/22',
                                      departure_city: 'Boston',
                                      arrival_city: 'Denver')
      @flight_4 = @air_1.flights.create!(number: "004",
                                      date: '4/13/22',
                                      departure_city: 'Hartford',
                                      arrival_city: 'Denver')
      @flight_5 = @air_2.flights.create!(number: "005",
                                      date: '5/14/22',
                                      departure_city: 'Denver',
                                      arrival_city: 'Providnce')
      @passenger_1 = Passenger.create!(name: "dude", age: 19)
      @passenger_2 = Passenger.create!(name: "kid", age: 10)
      @passenger_3 = Passenger.create!(name: "person", age: 20)
      @passenger_4 = Passenger.create!(name: "youth", age: 18)
      @passenger_5 = Passenger.create!(name: "meh", age: 31)
      @passenger_6 = Passenger.create!(name: "old", age: 75)

      @passenger_flight_1 = PassengerFlight.create!(flight_id: @flight_1.id, passenger_id: @passenger_1.id)
      @passenger_flight_2 = PassengerFlight.create!(flight_id: @flight_1.id, passenger_id: @passenger_2.id)
      @passenger_flight_3 = PassengerFlight.create!(flight_id: @flight_3.id, passenger_id: @passenger_3.id)
      @passenger_flight_4 = PassengerFlight.create!(flight_id: @flight_4.id, passenger_id: @passenger_4.id)
      @passenger_flight_5 = PassengerFlight.create!(flight_id: @flight_4.id, passenger_id: @passenger_5.id)
      @passenger_flight_6 = PassengerFlight.create!(flight_id: @flight_1.id, passenger_id: @passenger_6.id)
      @passenger_flight_7 = PassengerFlight.create!(flight_id: @flight_1.id, passenger_id: @passenger_5.id)
    end

    it 'knows its adult passengers' do
      expect(@air_1.adults).to eq([@passenger_1, @passenger_4, @passenger_5, @passenger_6])
    end
  end
end

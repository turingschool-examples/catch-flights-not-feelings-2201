require 'rails_helper'

RSpec.describe Airline, type: :model do
  it { should have_many :flights }
  it { should have_many(:passenger_flights).through :flights }
  it { should have_many(:passengers).through :passenger_flights }

  describe "instance methods" do
    it ".list_all_adult_passengers" do
      airline_a = Airline.create!(name: 'Airline A')
      airline_b = Airline.create!(name: 'Airline B')

      flight_a1 = airline_a.flights.create!(number: 'Flight A1', date: '01-01-1001', departure_city: 'Denver', arrival_city: 'Laurel')
      flight_a2 = airline_a.flights.create!(number: 'Flight A2', date: '01-01-1002', departure_city: 'Denver', arrival_city: 'Laurel')
      flight_b1 = airline_b.flights.create!(number: 'Flight B1', date: '01-01-2001', departure_city: 'Denver', arrival_city: 'Laurel')

      passenger_1 = Passenger.create!(name: 'Passenger 1', age: 18) #appears once (two exist, both in this airline)
      passenger_2 = Passenger.create!(name: 'Passenger 2', age: 17) #does not appear (underage)
      passenger_3 = Passenger.create!(name: 'Passenger 3', age: 30) #appears once (two exist, one in each airline)
      passenger_4 = Passenger.create!(name: 'Passenger 4', age: 40) #appears once
      passenger_5 = Passenger.create!(name: 'Passenger 5', age: 50) #does not appear (one exists in other airline)

      passenger_flight_1_a1 = PassengerFlight.create!(passenger_id: passenger_1.id, flight_id: flight_a1.id)
      passenger_flight_1_a2 = PassengerFlight.create!(passenger_id: passenger_1.id, flight_id: flight_a2.id)
      passenger_flight_1_b1 = PassengerFlight.create!(passenger_id: passenger_1.id, flight_id: flight_b1.id)
      passenger_flight_2_a1 = PassengerFlight.create!(passenger_id: passenger_2.id, flight_id: flight_a1.id)
      passenger_flight_2_a2 = PassengerFlight.create!(passenger_id: passenger_2.id, flight_id: flight_a2.id)
      passenger_flight_3_a1 = PassengerFlight.create!(passenger_id: passenger_3.id, flight_id: flight_a1.id)
      passenger_flight_3_b1 = PassengerFlight.create!(passenger_id: passenger_3.id, flight_id: flight_b1.id)
      passenger_flight_4_a1 = PassengerFlight.create!(passenger_id: passenger_4.id, flight_id: flight_a1.id)
      passenger_flight_5_b1 = PassengerFlight.create!(passenger_id: passenger_5.id, flight_id: flight_b1.id)

      expect(airline_a.list_all_adult_passengers).to eq([
                                                          passenger_1,
                                                          passenger_3,
                                                          passenger_4
                                                          ])
      expect(airline_b.list_all_adult_passengers).to eq([
                                                          passenger_1,
                                                          passenger_3,
                                                          passenger_5
                                                          ])
    end
  end
end

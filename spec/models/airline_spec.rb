require 'rails_helper'

RSpec.describe Airline, type: :model do
  it { should have_many :flights }
  it { should have_many(:passengers).through(:flights) }

  describe 'instance methods' do
    it 'only shows a unique list of passengers greater than or equal to 18' do
      airline_1 = Airline.create!(name: "JetBlue")
      flight_1 = airline_1.flights.create!(number: 7990, date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas")
      passenger_1 = Passenger.create!(name: "Tina Belcher", age: 13)
      passenger_2 = Passenger.create!(name: "Bob Belcher", age: 46)
      passenger_3 = Passenger.create!(name: "Louise Belcher", age: 9)
      passenger_4 = Passenger.create!(name: "Linda", age: 44)
      passenger_5 = Passenger.create!(name: "Big Bob", age: 84)
      passenger_6 = Passenger.create!(name: "Big Bob", age: 84)

      PassengerFlight.create!(passenger_id: passenger_1.id, flight_id: flight_1.id)
      PassengerFlight.create!(passenger_id: passenger_2.id, flight_id: flight_1.id)
      PassengerFlight.create!(passenger_id: passenger_3.id, flight_id: flight_1.id)
      PassengerFlight.create!(passenger_id: passenger_4.id, flight_id: flight_1.id)
      PassengerFlight.create!(passenger_id: passenger_5.id, flight_id: flight_1.id)
      PassengerFlight.create!(passenger_id: passenger_6.id, flight_id: flight_1.id)

      expect(airline_1.adult_passengers).to eq(["Big Bob", "Bob Belcher", "Linda"])
    end
  end

  it 'shows a list of adult_passengers by most number of flights taken' do
    airline_1 = Airline.create!(name: "JetBlue")
    flight_1 = airline_1.flights.create!(number: 7990, date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas")
    flight_2 = airline_1.flights.create!(number: 3940, date: "3/10/2022", departure_city: "Detroit", arrival_city: "Orlando")
    flight_3 = airline_1.flights.create!(number: 9091, date: "5/17/2022", departure_city: "Chicago", arrival_city: "Kansas City")

    passenger_1 = Passenger.create!(name: "Tina Belcher", age: 13)
    passenger_2 = Passenger.create!(name: "Bob Belcher", age: 46)
    passenger_3 = Passenger.create!(name: "Louise Belcher", age: 9)
    passenger_4 = Passenger.create!(name: "Linda", age: 44)
    passenger_5 = Passenger.create!(name: "Big Bob", age: 84)

    PassengerFlight.create!(passenger_id: passenger_1.id, flight_id: flight_1.id)
    PassengerFlight.create!(passenger_id: passenger_2.id, flight_id: flight_1.id)
    PassengerFlight.create!(passenger_id: passenger_2.id, flight_id: flight_2.id)
    PassengerFlight.create!(passenger_id: passenger_2.id, flight_id: flight_3.id)
    PassengerFlight.create!(passenger_id: passenger_4.id, flight_id: flight_1.id)
    PassengerFlight.create!(passenger_id: passenger_4.id, flight_id: flight_2.id)
    PassengerFlight.create!(passenger_id: passenger_5.id, flight_id: flight_2.id)

    expect(airline_1.most_flights).to eq([passenger_2, passenger_4, passenger_5])
  end
end

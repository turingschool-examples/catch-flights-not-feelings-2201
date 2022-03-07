require 'rails_helper'

RSpec.describe Airline, type: :model do
  it { should have_many :flights }

  it 'method' do
    airline = Airline.create(name: "American")
    # airline_2 = Airline.create(name: "LAM")
    flight_1 = airline.flights.create(number: "1727", date: "08/03/20", departure_city: "Denver", arrival_city: "Reno")
    flight_2 = airline.flights.create(number: "1567", date: "07/03/20", departure_city: "Cali", arrival_city: "Bogota")

    ana = Passenger.create(name: 'Ana', age: 45)
    eva = Passenger.create(name: 'Eva', age: 37)
    nelson = Passenger.create(name: 'Nelson', age: 40)
    adalid = Passenger.create(name: 'Adalid', age: 4)

    PassengerFlight.create(flight_id: flight_1.id, passenger_id: ana.id)
    PassengerFlight.create(flight_id: flight_1.id, passenger_id: eva.id)
    PassengerFlight.create(flight_id: flight_1.id, passenger_id: nelson.id)
    PassengerFlight.create(flight_id: flight_2.id, passenger_id: adalid.id)

    expect(airline.adult_passengers).to eq([ana.name, eva.name, nelson.name])
  end
end

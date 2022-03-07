require 'rails_helper'

RSpec.describe FlightPassenger, type: :model do
  it { should belong_to :flight }
  it { should belong_to :passenger }

  it 'finds and removes a record' do
    airline1 = Airline.create(name: "American")
    flight1 = airline1.flights.create(number: "7990", date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas")
    passenger1 = Passenger.create(name: "Tina Belcher", age: 13)
    passenger2 = Passenger.create(name: "Louise Belcher", age: 9)
    passenger3 = Passenger.create(name: "Bob Belcher", age: 46)
    FlightPassenger.create(flight_id: flight1.id, passenger_id: passenger1.id)
    FlightPassenger.create(flight_id: flight1.id, passenger_id: passenger2.id)
    FlightPassenger.create(flight_id: flight1.id, passenger_id: passenger3.id)

    expect(flight1.passengers).to eq([passenger1, passenger2, passenger3])

    FlightPassenger.find_and_delete(flight1.id, passenger2.id)

    flight1.reload

    expect(flight1.passengers).to eq([passenger1, passenger3])
  end
end

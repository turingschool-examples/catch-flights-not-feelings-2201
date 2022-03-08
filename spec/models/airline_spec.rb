require 'rails_helper'

RSpec.describe Airline, type: :model do
  it { should have_many :flights }
  it { should have_many(:passengers).through(:flights) }
end

RSpec.describe Airline, type: :model do
  it 'has adult passengers' do
    a1 = Airline.create!(name: "Frontier")
    a2 = Airline.create!(name: "Southwest")

    f1 = a1.flights.create!(number: 7990, date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas")
    f2 = a1.flights.create!(number: 7354, date: "2/7/2022", departure_city: "Glendale", arrival_city: "Denver")
    f3 = a1.flights.create!(number: 9235, date: "2/8/2022", departure_city: "SLC", arrival_city: "NYC")
    f4 = a2.flights.create!(number: 1625, date: "2/8/2022", departure_city: "SLC", arrival_city: "Philly")
    f5 = a2.flights.create!(number: 9057, date: "2/8/2022", departure_city: "Greenville", arrival_city: "Asheville")

    p1 = Passenger.create!(name: "Jerry", age: 42)
    p2 = Passenger.create!(name: "George", age: 16)
    p3 = Passenger.create!(name: "Elaine", age: 2)
    p4 = Passenger.create!(name: "Kramer", age: 44)
    p5 = Passenger.create!(name: "Charlie", age: 28)
    p6 = Passenger.create!(name: "Dennis", age: 31)
    p7 = Passenger.create!(name: "Dee", age: 33)

    pf1 = PassengerFlight.create!(flight_id: f1.id, passenger_id: p1.id)
    pf2 = PassengerFlight.create!(flight_id: f1.id, passenger_id: p2.id)
    pf3 = PassengerFlight.create!(flight_id: f2.id, passenger_id: p3.id)
    pf4 = PassengerFlight.create!(flight_id: f2.id, passenger_id: p4.id)
    pf5 = PassengerFlight.create!(flight_id: f3.id, passenger_id: p1.id)
    pf6 = PassengerFlight.create!(flight_id: f4.id, passenger_id: p6.id)
    pf7 = PassengerFlight.create!(flight_id: f5.id, passenger_id: p7.id)

    expect(a1.adult_passengers).to eq([p1,p4])
  end
end
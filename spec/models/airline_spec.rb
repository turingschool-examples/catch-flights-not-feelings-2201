require 'rails_helper'

RSpec.describe Airline, type: :model do
  it { should have_many :flights }
  it { should have_many(:passenger_flights).through(:flights) }
  it { should have_many(:passengers).through(:passenger_flights) }

  describe '.instance_methods' do
    before(:each) do
      @jetblue = Airline.create!(name: "JetBlue")

      @flight1 = @jetblue.flights.create!(number: "1", date: "01/01/2022", departure_city: "Miami", arrival_city: "Dallas", airline_id: @jetblue.id)
      @flight2 = @jetblue.flights.create!(number: "2", date: "01/10/2022", departure_city: "New Orleans", arrival_city: "Los Angeles", airline_id: @jetblue.id)

      @tupac = Passenger.create!(name: "Tupac", age: 24)
      @biggie = Passenger.create!(name: "Biggie", age: 17)
      @wayne = Passenger.create!(name: "Wayne", age: 21)

      @fp1 = PassengerFlight.create!(flight_id: @flight1.id, passenger_id: @tupac.id)
      @fp2 = PassengerFlight.create!(flight_id: @flight1.id, passenger_id: @wayne.id)
      @fp3 = PassengerFlight.create!(flight_id: @flight2.id, passenger_id: @wayne.id)
      @fp4 = PassengerFlight.create!(flight_id: @flight2.id, passenger_id: @biggie.id)
    end

    describe '.adult_passengers' do
      it 'provides a list of unique adult passengers' do
        result = @jetblue.adult_passengers

        expect(result).to include(@tupac)
        expect(result).to include(@wayne)
        expect(result).to_not include(@biggie)
        expect(result.length).to eq(2)
      end
    end
  end
end

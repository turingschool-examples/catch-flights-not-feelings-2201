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
      @flight3 = @jetblue.flights.create!(number: "3", date: "01/20/2022", departure_city: "Los Angeles", arrival_city: "London", airline_id: @jetblue.id)

      @tupac = Passenger.create!(name: "Tupac", age: 24)
      @biggie = Passenger.create!(name: "Biggie", age: 17)
      @wayne = Passenger.create!(name: "Wayne", age: 21)
      @nipsey = Passenger.create!(name: "Nipsey", age: 21)

      @fp1 = PassengerFlight.create!(flight_id: @flight1.id, passenger_id: @tupac.id)
      @fp2 = PassengerFlight.create!(flight_id: @flight1.id, passenger_id: @wayne.id)
      @fp3 = PassengerFlight.create!(flight_id: @flight2.id, passenger_id: @wayne.id)
      @fp4 = PassengerFlight.create!(flight_id: @flight2.id, passenger_id: @biggie.id)
      @fp5 = PassengerFlight.create!(flight_id: @flight3.id, passenger_id: @tupac.id)
      @fp6 = PassengerFlight.create!(flight_id: @flight3.id, passenger_id: @nipsey.id)
      @fp7 = PassengerFlight.create!(flight_id: @flight3.id, passenger_id: @wayne.id)
    end

    describe '.adult_passengers_by_frequent' do
      it 'provides a list of unique adult passengers, ordered by most frequent' do
        result = @jetblue.adult_passengers_by_frequent

        expect(result[0].name).to eq(@wayne.name)
        expect(result[1].name).to eq(@tupac.name)
        expect(result[2].name).to eq(@nipsey.name)
        expect(result).to_not include(@biggie.name)
        expect(result.length).to eq(3)
      end
    end
  end
end

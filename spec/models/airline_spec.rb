require 'rails_helper'

RSpec.describe Airline, type: :model do
  it { should have_many :flights }
  it { should have_many(:passenger_flights).through(:flights) }
  it { should have_many(:passengers).through(:passenger_flights) }
  describe 'class methods' do 
        @united = Airline.create!(name: 'United')
        @flight_1 = Flight.create!(number: 1, date: '01-02-2000', departure_city: 'Houston', arrival_city: 'Los Angeles', airline: @united)
        @flight_2 = Flight.create!(number: 2, date: '04-02-2000', departure_city: 'San Antonio', arrival_city: 'New York', airline: @united)
        @flight_3 = Flight.create!(number: 3, date: '07-02-2000', departure_city: 'San Francisco', arrival_city: 'Chicago', airline: @united)
        @baby_1 = Passenger.create!(name: 'Bob', age: 7)
        @flight_1.add_passenger(@baby_1)
        @adult_1 = Passenger.create!(name: 'Sam', age: 18)
        @flight_2.add_passenger(@adult_1)
        @adult_2 = Passenger.create!(name: 'John', age: 22)
        @flight_3.add_passenger(@adult_2)
        @adult_3 = Passenger.create!(name: 'Mike', age: 30)
    it 'will return uniq passengers of an airline' do 
      expect(Airline.get_uniq_passengers(@united).map(&:name).uniq).to eq(['Sam', "John"])
    end
    it 'will not include underage passengers' do 
      expect(Airline.get_uniq_passengers(@united).map(&:name).uniq).not_to include('Bob')
    end
    xit 'wont include passengers on other airlines' do 
      south_west_pass = Passenger.create(name: 'Johann', age: 30)
      south_west = Airline.create!(name: 'Southwest')
      south_west_flight = south_west.flights.create!(number: 4, date: '07-03-2000', departure_city: 'San Francisco', arrival_city: 'Chicago')
      south_west_flight.add_passenger(south_west_pass)
      expect(Airline.get_uniq_passengers(@united).map(&:name).uniq).to eq(['John', "Sam"])
    end
  end
end
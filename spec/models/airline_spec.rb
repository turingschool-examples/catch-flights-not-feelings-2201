require 'rails_helper'

RSpec.describe Airline, type: :model do
  it { should have_many :flights }
  it { should have_many(:passenger_flights).through(:flights) }
  it { should have_many(:passengers).through(:passenger_flights) }
  describe 'class methods' do
     before :each do 
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
      end
      it 'will return adult passengers of an airline' do 
        expect(@united.adult_passengers).to eq([@adult_1, @adult_2])
      end
      it 'will not include underage passengers' do 
        expect(@united.adult_passengers).not_to include(@baby_1)
      end
      it 'wont include passengers on other airlines' do 
        southwest = Airline.create!(name: 'Southwest')
        flight_4 = Flight.create!(number: 3, date: '07-02-2000', departure_city: 'San Francisco', arrival_city: 'Chicago', airline: southwest)
        adult_3 = Passenger.create!(name: 'Mike', age: 30)
        flight_4.add_passenger(adult_3)
        expect(@united.adult_passengers).not_to include(adult_3)
      end
    end
  end
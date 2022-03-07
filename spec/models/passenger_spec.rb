require 'rails_helper'

RSpec.describe Passenger, type: :model do
  describe 'relationships' do
    it { should have_many :flight_passengers }
    it { should have_many(:flights).through(:flight_passengers) }
  end

  describe 'class methods' do
    describe 'unique_adult_passengers' do
      xit "goes through passengers and returns a unique list of only adults" do
        airline = Airline.create!(name: "American")
        flight1 = airline.flights.create!(number: "7990", date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas")
        flight2 = airline.flights.create!(number: "3940", date: "3/10/2022", departure_city: "Detroit", arrival_city: "Orlando")

        passenger1 = flight1.passengers.create!(name: 'Tina Belcher', age: 13)
        passenger2 = flight1.passengers.create!(name: 'Loiuse Belcher', age: 9)
        passenger3 = flight2.passengers.create!(name: 'Bob Belcher', age: 46)
        passenger4 = flight2.passengers.create!(name: 'Linda Belcher', age: 44)
        passenger5 = flight1.passengers.create!(name: 'Big Bob', age: 84)
        passenger6 = flight2.passengers.create!(name: 'Big Bob', age: 84)

        expect(Passenger.unique_adult_passengers).to eq([passenger3.name, passenger5.name, passenger4.name])
      end
    end
  end
end

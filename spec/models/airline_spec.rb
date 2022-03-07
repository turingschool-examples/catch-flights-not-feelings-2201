require 'rails_helper'

RSpec.describe Airline, type: :model do
  describe 'relationships' do
    it { should have_many :flights }
  end

  describe 'methods' do
    before(:each) do
      @airline = Airline.create!(name: "Delta Airlines")

      @flight = @airline.flights.create!(number: 1395, date: "03/9/2022", departure_city: "Washington", arrival_city: "Powell")
      @flight_2 = @airline.flights.create!(number: 1396, date: "03/20/2022", departure_city: "Denver", arrival_city: "Chicago")

      @passenger = @flight.passengers.create!(name: "Joey", age: 20)
      @passenger_2 = @flight.passengers.create!(name: "Little Joey", age: 16)

      @passenger_3 = @flight_2.passengers.create!(name: "Hubert", age: 21)
    end

    it '::uniq_adult_passengers' do
      expect(@airline.uniq_adult_passengers).to eq([@passenger.name, @passenger_3.name])
    end

  end
 end

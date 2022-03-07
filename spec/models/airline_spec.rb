require 'rails_helper'

RSpec.describe Airline, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it { should have_many :flights }
    it { should have_many :passengers }
    it { should have_many :passenger_flights }
  end

  describe "instance method" do
    before :each do
      @airline_1 = Airline.create!(name: "Southwest")

      @flight_1 = @airline_1.flights.create!(number: 7946, date: "01/01/22", departure_city: "Denver", arrival_city: "Los Angeles" )
      @flight_2 = @airline_1.flights.create!(number: 1346, date: "02/02/22", departure_city: "New York", arrival_city: "Austin" )

      @passenger_1 = @flight_1.passengers.create!(name: "Randy Smith", age: 25 )
      @passenger_2 = @flight_1.passengers.create!(name: "Tina Belcher", age: 20 )
      @passenger_3 = @flight_2.passengers.create!(name: "Big Bob", age: 40 )
      @passenger_4 = @flight_2.passengers.create!(name: "Little Bob", age: 15 )
      duplicate = PassengerFlight.create!(passenger_id: @passenger_3.id, flight_id: @flight_1.id)

    end
    it "shows uniqe adults" do
      
      expect(@airline_1.uniq_adults).to eq([@passenger_3, @passenger_1, @passenger_2])
    end
  end
end

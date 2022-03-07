require 'rails_helper'

RSpec.describe Flight, type: :model do
  describe 'relationships' do
    it {should have_many(:flight_passengers)}
    it {should have_many(:passengers).through(:flight_passengers)}
  end

  describe 'instance methods' do
    describe '.airline_name' do
      it "returns the flights airline name" do
        @airline1 = Airline.create!(name: "Southwest")
        @airline2 = Airline.create!(name: "Frontier")
        @flight1 = @airline1.flights.create!(number: 123,
                                            date: "12/12/21",
                                            departure_city: "DEN",
                                            arrival_city: "SJC")

        expect(@flight1.airline_name).to eq(@airline1.name)
        expect(@flight1.airline_name).to eq("Southwest")
      end
    end
  end
end

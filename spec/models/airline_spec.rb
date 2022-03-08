require 'rails_helper'

RSpec.describe Airline, type: :model do
  describe "relationships" do
    it { should have_many :flights }

    it {should have_many(:passengers).through(:flights)}

      before :each do
        @pass1 = Passenger.create!(name:'Sue', age: 52)
        @pass2 = Passenger.create!(name:'Crystal', age: 13)
        @pass3 = Passenger.create!(name:'Ammon', age: 44)
        @pass4 = Passenger.create!(name:'Jill', age: 12)
        @pass5 = Passenger.create!(name:'Bob', age: 22)
        @air1 = Airline.create!(name: 'Fly')
        @air2 = Airline.create!(name: 'High')
        @flight1 = Flight.create!(number: '1', date: '01/02', departure_city: 'MEX', arrival_city: 'BOS', airline_id: @air1.id )
        @flight2 = Flight.create!(number: '2', date: '02/02', departure_city: 'LAX', arrival_city: 'MUM', airline_id: @air1.id )

        PassengerFlight.create!(passenger_id: @pass1.id, flight_id: @flight1.id)
        PassengerFlight.create!(passenger_id: @pass2.id, flight_id: @flight2.id)
        PassengerFlight.create!(passenger_id: @pass3.id, flight_id: @flight2.id)
        PassengerFlight.create!(passenger_id: @pass4.id, flight_id: @flight1.id)
        PassengerFlight.create!(passenger_id: @pass5.id, flight_id: @flight1.id)

      end
    it 'can list unique adult passengers' do
     expect(@air1.adults).to eq([@pass1, @pass3, @pass5])
    end
  end
end

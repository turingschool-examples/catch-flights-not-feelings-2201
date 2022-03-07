require 'rails_helper'

RSpec.describe Airline, type: :model do
  it { should have_many :flights }
  it { should have_many(:passengers).through(:flights)}

  describe 'instance methods' do
   it '#adults' do
     @luftansa = Airline.create!(name: 'Luftansa')
     @southwest = Airline.create!(name: 'Southwest')

     @flight_1 = @luftansa.flights.create!(number: '1', date: '1/1/22', departure_city: 'Denver', arrival_city: 'DC')
     @flight_2 = @southwest.flights.create!(number: '2', date: '1/2/22', departure_city: 'Denver', arrival_city: 'DC')

     @gunnar = Passenger.create!(name: 'Gunnar', age: 37)
     @sakic = Passenger.create!(name: 'Sakic', age: 27)
     @onyx = Passenger.create!(name: 'Onyx', age: 29)
     @priska = Passenger.create!(name: 'Priska', age: 27)
     @lynn = Passenger.create!(name: 'Lynn', age: 17)
     @euro = Passenger.create!(name: 'Euro', age: 17)

     @flight_pass_1 = FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @gunnar.id)
     @flight_pass_2 = FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @sakic.id)
     @flight_pass_3 = FlightPassenger.create!(flight_id: @flight_2.id, passenger_id: @onyx.id)
     @flight_pass_4 = FlightPassenger.create!(flight_id: @flight_2.id, passenger_id: @priska.id)
     @flight_pass_5 = FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @lynn.id)
     @flight_pass_6 = FlightPassenger.create!(flight_id: @flight_2.id, passenger_id: @euro.id)


     expect(@luftansa.adults).to eq([@gunnar, @sakic])
     expect(@southwest.adults).to eq([@onyx, @priska])

     #test that its really only grabbing adults
     expect(@luftansa.passengers).to eq([@gunnar, @sakic, @lynn])
     expect(@southwest.passengers).to eq([@onyx, @priska, @euro])



   end
 end
end

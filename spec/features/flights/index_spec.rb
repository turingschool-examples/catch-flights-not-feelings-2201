require 'rails_helper'
describe 'flights index page' do
  before do
    @luftansa = Airline.create!(name: 'Luftansa')
    @southwest = Airline.create!(name: 'Southwest')

    @flight_1 = @luftansa.flights.create!(number: '1', date: '1/1/22', departure_city: 'Denver', arrival_city: 'DC')
    @flight_2 = @southwest.flights.create!(number: '2', date: '1/2/22', departure_city: 'Denver', arrival_city: 'DC')

    @gunnar = Passenger.create!(name: 'Gunnar', age: 37)
    @sakic = Passenger.create!(name: 'Sakic', age: 27)
    @onyx = Passenger.create!(name: 'Onyx', age: 29)
    @priska = Passenger.create!(name: 'Priska', age: 27)

    @flight_pass_1 = FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @gunnar.id)
    @flight_pass_2 = FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @sakic.id)
    @flight_pass_3 = FlightPassenger.create!(flight_id: @flight_2.id, passenger_id: @onyx.id)
    @flight_pass_4 = FlightPassenger.create!(flight_id: @flight_2.id, passenger_id: @priska.id)

    visit '/flights'
  end
  it 'I see a list of all flight numbers, the name of the airline and the names of all passengers on that flight' do

    within "div.flight-#{@flight_1.id}" do
      expect(page).to have_content("Flight: #{@flight_1.number} Airline: #{@luftansa.name}")
      expect(page).to have_content("Passengers: #{@gunnar.name} #{@sakic.name}")
    end

    within "div.flight-#{@flight_2.id}" do
      expect(page).to have_content("Flight: #{@flight_2.number} Airline: #{@southwest.name}")
      expect(page).to have_content("Passengers: #{@onyx.name} #{@priska.name}")
    end
  end
end

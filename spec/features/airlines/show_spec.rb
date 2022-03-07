require 'rails_helper'
describe 'airline show page' do
  before do
    @luftansa = Airline.create!(name: 'Luftansa')
    @southwest = Airline.create!(name: 'Southwest')

    @flight_1 = @luftansa.flights.create!(number: '1', date: '1/1/22', departure_city: 'Denver', arrival_city: 'DC')
    @flight_2 = @southwest.flights.create!(number: '2', date: '1/2/22', departure_city: 'Denver', arrival_city: 'DC')

    @gunnar = Passenger.create!(name: 'Gunnar', age: 37)
    @sakic = Passenger.create!(name: 'Sakic', age: 27)
    @onyx = Passenger.create!(name: 'Onyx', age: 29)
    @priska = Passenger.create!(name: 'Priska', age: 27)
    @lynn = Passenger.create!(name: 'Lynn', age: 17)

    @flight_pass_1 = FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @gunnar.id)
    @flight_pass_2 = FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @sakic.id)
    @flight_pass_3 = FlightPassenger.create!(flight_id: @flight_2.id, passenger_id: @onyx.id)
    @flight_pass_4 = FlightPassenger.create!(flight_id: @flight_2.id, passenger_id: @priska.id)
    @flight_pass_5 = FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @lynn.id)


    visit airline_path(@luftansa.id)
  end
  it 'I see only one airline' do
    within 'div.name' do
      expect(page).to have_content(@luftansa.name)
      expect(page).to_not have_content(@southwest.name)
    end
  end
  it 'I see a unique list of adult passengers that have flights on that airline' do

    within 'div.adults' do
      expect(page).to have_content("Passengers: #{@gunnar.name} #{@sakic.name}")
      expect(page).to_not have_content(@onyx.name)
      expect(page).to_not have_content(@priska.name)
    end
  end
  it 'I do not see under 18 passengers that have flights on that airline' do
    within 'div.adults' do
      expect(page).to_not have_content(@lynn.name)
    end
  end
end

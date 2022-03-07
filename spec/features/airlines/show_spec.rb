require 'rails_helper'
describe 'airline show page' do
  before do
    @american = Airline.create!(name: 'American')
    @delta = Airline.create!(name: 'Delta')
    @jet_blue = Airline.create!(name: 'Jet Blue')
    @southwest = Airline.create!(name: 'Southwest')
    @united = Airline.create!(name: 'United')

    @flight1 = @american.flights.create!(number: '7990', date: '2/7/2022', departure_city: 'Glendale',
                                         arrival_city: 'Dallas')
    @flight2 = @american.flights.create!(number: '3940', date: '3/10/2022', departure_city: 'Detroit',
                                         arrival_city: 'Orlando')
    @flight3 = @delta.flights.create!(number: '9091', date: '5/17/2022', departure_city: 'Chicago',
                                      arrival_city: 'Kansas City')
    @flight4 = @united.flights.create!(number: '6798', date: '10/9/2022', departure_city: 'Tulsa',
                                       arrival_city: 'Fresno')
    @flight5 = @united.flights.create!(number: '9665', date: '11/22/2022', departure_city: 'Durham',
                                       arrival_city: 'New Orleans')
    @tina = Passenger.create!(name: 'Tina', age: 13)
    @louise = Passenger.create!(name: 'Louise', age: 9)
    @bob = Passenger.create!(name: 'Bob', age: 46)
    @linda = Passenger.create!(name: 'Linda', age: 44)
    @big_bob = Passenger.create!(name: 'Big Bob', age: 84)

    @passenger_flight_1 = PassengerFlight.create!(flight_id: @flight4.id, passenger_id: @bob.id)
    @passenger_flight_2 = PassengerFlight.create!(flight_id: @flight4.id, passenger_id: @linda.id)
    @passenger_flight_3 = PassengerFlight.create!(flight_id: @flight4.id, passenger_id: @louise.id)
    @passenger_flight_4 = PassengerFlight.create!(flight_id: @flight5.id, passenger_id: @tina.id)
    @passenger_flight_5 = PassengerFlight.create!(flight_id: @flight5.id, passenger_id: @linda.id)
    visit "/airlines/#{@united.id}"
  end
  it 'shows me a list of all the passengers with that airline with no duplicates and only adults' do
    expect(page).to have_content("Adult Passengers: #{@bob.name} #{@linda.name}")
    expect(page).to_not have_content(@tina.name)
    expect(page).to_not have_content(@louise.name)
  end
end

require 'rails_helper'
RSpec.describe 'airline show page' do
  it 'I see a unique list of adult passengers that have flights on that airline' do

    frontier = Airline.create!(name: 'Frontier')
    flight_1 = frontier.flights.create!(number: '1', date: '1/1/22', departure_city: 'Denver', arrival_city: 'DC')
    luis = Passenger.create!(name: 'Seth', age: 39)
    peter = Passenger.create!(name: 'Sam', age: 37)
    PassengerFlight.create!(flight_id: flight_1.id, passenger_id: luis.id)
    PassengerFlight.create!(flight_id: flight_1.id, passenger_id: peter.id)

    flight_2 = frontier.flights.create!(number: '2', date: '1/2/22', departure_city: 'Denver', arrival_city: 'DC')
    miguel = Passenger.create!(name: 'Jim', age: 22)
    wali = Passenger.create!(name: 'Josh', age: 17)
    PassengerFlight.create!(flight_id: flight_2.id, passenger_id: miguel.id)
    PassengerFlight.create!(flight_id: flight_2.id, passenger_id: wali.id)
    PassengerFlight.create!(flight_id: flight_2.id, passenger_id: luis.id)

    visit "/airlines/#{frontier.id}"



    expect(page).to have_content("Passengers: #{luis.name} #{peter.name} #{miguel.name}")
    expect(page).to_not have_content(wali.name)
  end

end

require 'rails_helper'
RSpec.describe 'airline show page' do
  it 'I see a unique list of adult passengers that have flights on that airline' do

    frontier = Airline.create!(name: 'Frontier')
    flight_1 = frontier.flights.create!(number: '1', date: '1/1/22', departure_city: 'Denver', arrival_city: 'DC')
    seth = Passenger.create!(name: 'Seth', age: 29)
    sam = Passenger.create!(name: 'Sam', age: 27)
    PassengerFlight.create!(flight_id: flight_1.id, passenger_id: seth.id)
    PassengerFlight.create!(flight_id: flight_1.id, passenger_id: sam.id)

    flight_2 = frontier.flights.create!(number: '2', date: '1/2/22', departure_city: 'Denver', arrival_city: 'DC')
    jim = Passenger.create!(name: 'Jim', age: 29)
    josh = Passenger.create!(name: 'Josh', age: 17)
    PassengerFlight.create!(flight_id: flight_2.id, passenger_id: jim.id)
    PassengerFlight.create!(flight_id: flight_2.id, passenger_id: josh.id)
    PassengerFlight.create!(flight_id: flight_2.id, passenger_id: seth.id)

    visit "/airlines/#{frontier.id}"



    expect(page).to have_content("Passengers: #{seth.name} #{sam.name} #{jim.name}")
    expect(page).to_not have_content(josh.name)
  end

end

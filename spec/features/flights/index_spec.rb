require 'rails_helper'
RSpec.describe 'flights Index Page' do
it  'displays flights attributes' do

    frontier = Airline.create!(name: 'Frontier')
    flight_1 = frontier.flights.create!(number: '1', date: '1/1/22', departure_city: 'Denver', arrival_city: 'DC')
    passenger_1 = Passenger.create!(name: 'Josh', age: 29)
    passenger_2 = Passenger.create!(name: 'Peter', age: 27)
    PassengerFlight.create!(flight_id: flight_1.id, passenger_id: passenger_1.id)
    PassengerFlight.create!(flight_id: flight_1.id, passenger_id: passenger_2.id)

    delta = Airline.create!(name: 'Delta')
    flight_2 = delta.flights.create!(number: '2', date: '1/2/22', departure_city: 'Denver', arrival_city: 'DC')
    passenger_3 = Passenger.create!(name: 'Luis', age: 29)
    passenger_4 = Passenger.create!(name: 'Miguel', age: 27)
    PassengerFlight.create!(flight_id: flight_2.id, passenger_id: passenger_3.id)
    PassengerFlight.create!(flight_id: flight_2.id, passenger_id: passenger_4.id)

    visit '/flights'

    expect(page).to have_content("Flight: #{flight_1.number} Airline: #{frontier.name}")
    expect(page).to have_content("Passengers: #{passenger_1.name} #{passenger_2.name}")
    expect(page).to have_content("Flight: #{flight_2.number} Airline: #{delta.name}")
    expect(page).to have_content("Passengers: #{passenger_3.name} #{passenger_4.name}")

end
end

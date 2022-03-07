require 'rails_helper'
RSpec.describe 'flights Index Page' do
it  'displays flights attributes' do

    frontier = Airline.create!(name: 'Frontier')
    flight_1 = frontier.flights.create!(number: '2563', date: '01/08/22', departure_city: 'Miami', arrival_city: 'Las Vegas')
    passenger_1 = Passenger.create!(name: 'Josh', age: 29)
    passenger_2 = Passenger.create!(name: 'Peter', age: 27)
    PassengerFlight.create!(flight_id: flight_1.id, passenger_id: passenger_1.id)
    PassengerFlight.create!(flight_id: flight_1.id, passenger_id: passenger_2.id)

    delta = Airline.create!(name: 'Delta')
    flight_2 = delta.flights.create!(number: '2784', date: '01/11/21', departure_city: 'Hawai', arrival_city: 'New York')
    passenger_3 = Passenger.create!(name: 'Luis', age: 29)
    passenger_4 = Passenger.create!(name: 'Miguel', age: 17)
    PassengerFlight.create!(flight_id: flight_2.id, passenger_id: passenger_3.id)
    PassengerFlight.create!(flight_id: flight_2.id, passenger_id: passenger_4.id)

    visit '/flights'

    expect(page).to have_content("Flight: #{flight_1.number} Airline: #{frontier.name}")
    expect(page).to have_content("Passengers: #{passenger_1.name} #{passenger_2.name}")
    expect(page).to have_content("Flight: #{flight_2.number} Airline: #{delta.name}")
    expect(page).to have_content("Passengers: #{passenger_3.name} #{passenger_4.name}")

end

it 'can remove a passenger' do
  frontier = Airline.create!(name: 'Frontier')
  flight_1 = frontier.flights.create!(number: '2563', date: '01/08/22', departure_city: 'Miami', arrival_city: 'Las Vegas')
  passenger_1 = Passenger.create!(name: 'Josh', age: 29)
  passenger_2 = Passenger.create!(name: 'Peter', age: 27)
  PassengerFlight.create!(flight_id: flight_1.id, passenger_id: passenger_1.id)
  PassengerFlight.create!(flight_id: flight_1.id, passenger_id: passenger_2.id)

  delta = Airline.create!(name: 'Delta')
  flight_2 = delta.flights.create!(number: '2784', date: '01/11/21', departure_city: 'Hawai', arrival_city: 'New York')
  passenger_3 = Passenger.create!(name: 'Luis', age: 29)
  passenger_4 = Passenger.create!(name: 'Miguel', age: 17)
  PassengerFlight.create!(flight_id: flight_2.id, passenger_id: passenger_3.id)
  PassengerFlight.create!(flight_id: flight_2.id, passenger_id: passenger_4.id)

  visit '/flights'

    expect(page).to have_button("Remove #{passenger_1.name}")
    click_button("Remove #{passenger_1.name}")
    expect(current_path).to eq("/flights")
    expect(page).to_not have_content(passenger_1.name)
  end
end

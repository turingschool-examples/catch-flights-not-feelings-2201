require 'rails_helper'

RSpec.describe 'airlines show page' do
  #us3
  it "exists and lists its passengers once" do
    airline_a = Airline.create!(name: 'Airline A')
    airline_b = Airline.create!(name: 'Airline B')

    flight_a1 = airline_a.flights.create!(number: 'Flight A1', date: '01-01-1001', departure_city: 'Denver', arrival_city: 'Laurel')
    flight_a2 = airline_a.flights.create!(number: 'Flight A2', date: '01-01-1002', departure_city: 'Denver', arrival_city: 'Laurel')
    flight_b1 = airline_b.flights.create!(number: 'Flight B1', date: '01-01-2001', departure_city: 'Denver', arrival_city: 'Laurel')

    passenger_1 = Passenger.create!(name: 'Passenger 1', age: 18) #appears once (two exist, both in this airline)
    passenger_2 = Passenger.create!(name: 'Passenger 2', age: 17) #does not appear
    passenger_3 = Passenger.create!(name: 'Passenger 3', age: 30) #appears once (two exist, one in each airline)
    passenger_4 = Passenger.create!(name: 'Passenger 4', age: 40) #appears once
    passenger_5 = Passenger.create!(name: 'Passenger 5', age: 50) #does not appear (one exists in other airline)

    passenger_flight_1_a1 = PassengerFlight.create!(passenger_id: passenger_1.id, flight_id: flight_a1.id)
    passenger_flight_1_a2 = PassengerFlight.create!(passenger_id: passenger_1.id, flight_id: flight_a2.id)
    passenger_flight_1_b1 = PassengerFlight.create!(passenger_id: passenger_1.id, flight_id: flight_b1.id)
    passenger_flight_2_a1 = PassengerFlight.create!(passenger_id: passenger_2.id, flight_id: flight_a1.id)
    passenger_flight_2_a2 = PassengerFlight.create!(passenger_id: passenger_2.id, flight_id: flight_a2.id)
    passenger_flight_3_a1 = PassengerFlight.create!(passenger_id: passenger_3.id, flight_id: flight_a1.id)
    passenger_flight_3_b1 = PassengerFlight.create!(passenger_id: passenger_3.id, flight_id: flight_b1.id)
    passenger_flight_4_a1 = PassengerFlight.create!(passenger_id: passenger_4.id, flight_id: flight_a1.id)
    passenger_flight_5_b1 = PassengerFlight.create!(passenger_id: passenger_5.id, flight_id: flight_b1.id)

    visit "/airlines/#{airline_a.id}"
    expect(current_path).to eq("/airlines/#{airline_a.id}")

    expect(page).to have_content(passenger_1.name)
    expect(page).to_not have_content(passenger_2.name)
    expect(page).to have_content(passenger_3.name)
    expect(page).to have_content(passenger_4.name)
    expect(page).to_not have_content(passenger_5.name)
  end

  #us4
  it "lists its passengers in order of flights taken" do
    airline_a = Airline.create!(name: 'Airline A')
    airline_b = Airline.create!(name: 'Airline B')

    flight_a1 = airline_a.flights.create!(number: 'Flight A1', date: '01-01-1001', departure_city: 'Denver', arrival_city: 'Laurel')
    flight_a2 = airline_a.flights.create!(number: 'Flight A2', date: '01-01-1002', departure_city: 'Denver', arrival_city: 'Laurel')
    flight_b1 = airline_b.flights.create!(number: 'Flight B1', date: '01-01-2001', departure_city: 'Denver', arrival_city: 'Laurel')

    flight_a3 = airline_a.flights.create!(number: 'Flight A3', date: '01-01-1003', departure_city: 'Denver', arrival_city: 'Laurel')
    flight_a4 = airline_a.flights.create!(number: 'Flight A4', date: '01-01-1004', departure_city: 'Denver', arrival_city: 'Laurel')

    passenger_1 = Passenger.create!(name: 'Passenger 1', age: 18) #appears once (two exist, both in this airline)
    passenger_2 = Passenger.create!(name: 'Passenger 2', age: 17) #does not appear (underage)
    passenger_3 = Passenger.create!(name: 'Passenger 3', age: 30) #appears once (two exist, one in each airline)
    passenger_4 = Passenger.create!(name: 'Passenger 4', age: 40) #appears once
    passenger_5 = Passenger.create!(name: 'Passenger 5', age: 50) #does not appear (one exists in other airline)

    passenger_flight_1_a1 = PassengerFlight.create!(passenger_id: passenger_1.id, flight_id: flight_a1.id)
    passenger_flight_1_a2 = PassengerFlight.create!(passenger_id: passenger_1.id, flight_id: flight_a2.id)
    passenger_flight_1_b1 = PassengerFlight.create!(passenger_id: passenger_1.id, flight_id: flight_b1.id)
    passenger_flight_2_a1 = PassengerFlight.create!(passenger_id: passenger_2.id, flight_id: flight_a1.id)
    passenger_flight_2_a2 = PassengerFlight.create!(passenger_id: passenger_2.id, flight_id: flight_a2.id)
    passenger_flight_3_a1 = PassengerFlight.create!(passenger_id: passenger_3.id, flight_id: flight_a1.id)
    passenger_flight_3_b1 = PassengerFlight.create!(passenger_id: passenger_3.id, flight_id: flight_b1.id)
    passenger_flight_4_a1 = PassengerFlight.create!(passenger_id: passenger_4.id, flight_id: flight_a1.id)
    passenger_flight_5_b1 = PassengerFlight.create!(passenger_id: passenger_5.id, flight_id: flight_b1.id)

    passenger_flight_4_a3 = PassengerFlight.create!(passenger_id: passenger_4.id, flight_id: flight_a3.id)
    passenger_flight_4_a4 = PassengerFlight.create!(passenger_id: passenger_4.id, flight_id: flight_a4.id)

    visit "/airlines/#{airline_a.id}"

    within ".passenger-0" do
      expect(page).to_not have_content(passenger_1.name)
      expect(page).to_not have_content(passenger_2.name)
      expect(page).to_not have_content(passenger_3.name)
      expect(page).to have_content(passenger_4.name)
      expect(page).to_not have_content(passenger_5.name)
    end

    within ".passenger-1" do
      expect(page).to have_content(passenger_1.name)
      expect(page).to_not have_content(passenger_2.name)
      expect(page).to_not have_content(passenger_3.name)
      expect(page).to_not have_content(passenger_4.name)
      expect(page).to_not have_content(passenger_5.name)
    end

    within ".passenger-2" do
      expect(page).to_not have_content(passenger_1.name)
      expect(page).to_not have_content(passenger_2.name)
      expect(page).to have_content(passenger_3.name)
      expect(page).to_not have_content(passenger_4.name)
      expect(page).to_not have_content(passenger_5.name)
    end
  end
end

require 'rails_helper'

RSpec.describe 'the airline show page' do
  before(:each) do
    @air_1 = Airline.create!(name: 'Southwest')
    @air_2 = Airline.create!(name: 'Delta')
    @air_3 = Airline.create!(name: 'Jetblue')

    @flight_1 = @air_1.flights.create!(number: "001",
                                    date: '1/10/22',
                                    departure_city: 'Providence',
                                    arrival_city: 'Denver')
    @flight_2 = @air_2.flights.create!(number: "002",
                                    date: '2/11/22',
                                    departure_city: 'Tampa',
                                    arrival_city: 'Denver')
    @flight_3 = @air_3.flights.create!(number: "003",
                                    date: '3/12/22',
                                    departure_city: 'Boston',
                                    arrival_city: 'Denver')
    @flight_4 = @air_1.flights.create!(number: "004",
                                    date: '4/13/22',
                                    departure_city: 'Hartford',
                                    arrival_city: 'Denver')
    @flight_5 = @air_2.flights.create!(number: "005",
                                    date: '5/14/22',
                                    departure_city: 'Denver',
                                    arrival_city: 'Providnce')
    @passenger_1 = Passenger.create!(name: "dude", age: 19)
    @passenger_2 = Passenger.create!(name: "kid", age: 10)
    @passenger_3 = Passenger.create!(name: "person", age: 20)
    @passenger_4 = Passenger.create!(name: "youth", age: 18)
    @passenger_5 = Passenger.create!(name: "meh", age: 31)
    @passenger_6 = Passenger.create!(name: "old", age: 75)

    @passenger_flight_1 = PassengerFlight.create!(flight_id: @flight_1.id, passenger_id: @passenger_1.id)
    @passenger_flight_2 = PassengerFlight.create!(flight_id: @flight_1.id, passenger_id: @passenger_2.id)
    @passenger_flight_3 = PassengerFlight.create!(flight_id: @flight_3.id, passenger_id: @passenger_3.id)
    @passenger_flight_4 = PassengerFlight.create!(flight_id: @flight_4.id, passenger_id: @passenger_4.id)
    @passenger_flight_5 = PassengerFlight.create!(flight_id: @flight_4.id, passenger_id: @passenger_5.id)
    @passenger_flight_6 = PassengerFlight.create!(flight_id: @flight_1.id, passenger_id: @passenger_6.id)
    @passenger_flight_7 = PassengerFlight.create!(flight_id: @flight_1.id, passenger_id: @passenger_5.id)
  end

      #   User Story 3, Airline's Passengers
      #
      # As a visitor
      # When I visit an airline's show page
      # Then I see a list of passengers that have flights on that airline
      # And I see that this list is unique (no duplicate passengers)
      # And I see that this list only includes adult passengers
      #
      # (Note: an adult is anyone with age greater than or equal to 18)

      it 'lists all passengers of an airline over the age of 18' do
        visit "/airlines/#{@air_1.id}"
        save_and_open_page
        expect(page).to have_content(@passenger_1.name)
        expect(page).to have_content(@passenger_4.name)
        expect(page).to have_content(@passenger_5.name)
        expect(page).to have_content(@passenger_6.name)
        expect(page).to_not have_content(@passenger_2.name)

      end
end

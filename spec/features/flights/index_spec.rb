require 'rails_helper'

RSpec.describe 'Flights Index Page' do
  before(:each) do
    @jetblue = Airline.create!(name: "JetBlue")
    @flight1 = @jetblue.flights.create!(number: "1", date: "01/01/2022", departure_city: "Miami", arrival_city: "Dallas", airline_id: @jetblue.id)
    @flight2 = @jetblue.flights.create!(number: "2", date: "01/10/2022", departure_city: "New Orleans", arrival_city: "Los Angeles", airline_id: @jetblue.id)

    @tupac = Passenger.create!(name: "Tupac", age: 24)
    @wayne = Passenger.create!(name: "Wayne", age: 21)

    @fp1 = PassengerFlight.create!(flight_id: @flight1.id, passenger_id: @tupac.id)
    @fp2 = PassengerFlight.create!(flight_id: @flight1.id, passenger_id: @wayne.id)
    @fp3 = PassengerFlight.create!(flight_id: @flight2.id, passenger_id: @wayne.id)
  end

  describe 'User Story 1' do
    it 'visits flights index page and shows a list of all flight numbers' do
      visit flights_path
      expect(current_path).to eq(flights_path)

      within "div.flights_#{@flight1.number}" do
        expect(page).to have_content(@flight1.number)
      end
    end

    it 'next to each flight number, it shows the arline of that flight' do
      visit flights_path
      expect(current_path).to eq(flights_path)

      within "div.flights_#{@flight1.number}" do
        expect(page).to have_content(@flight1.airline.name)
      end
    end

    it 'under each flight number it lists all passengers on that flight' do
      visit flights_path
      expect(current_path).to eq(flights_path)

      within "div.passengers_#{@flight1.number}" do
        expect(page).to have_content(@tupac.name)
        expect(page).to have_content(@wayne.name)
      end
    end
  end

  describe 'User Story 2' do
    it 'has a button to remove a passenger from flight' do
      visit flights_path
      expect(current_path).to eq(flights_path)

      within "div.flights_#{@flight1.number}" do
        expect(page).to have_button("Remove #{@wayne.name}")
      end
    end

    it 'clicking that button removes the passenger from ONLY that flight' do
      visit flights_path
      expect(current_path).to eq(flights_path)

      within "div.flights_#{@flight1.number}" do
        click_on "Remove #{@wayne.name}"
      end
      expect(current_path).to eq(flights_path)
      expect(page).to have_content("#{@wayne.name} has been removed from Flight No: #{@flight1.number}")

      within "div.passengers_#{@flight1.number}" do
        expect(page).to_not have_content(@wayne.name)
      end

      within "div.passengers_#{@flight2.number}" do
        expect(page).to have_content(@wayne.name)
      end
    end
  end
end

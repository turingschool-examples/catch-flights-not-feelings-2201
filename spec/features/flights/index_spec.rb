require 'rails_helper'

RSpec.describe 'Flights Index Page' do
  before(:each) do
    @jetblue = Airline.create!(name: "JetBlue")
    @flight1 = @jetblue.flights.create!(number: "1", date: "01/01/2022", departure_city: "Miami", arrival_city: "Dallas", airline_id: @jetblue.id)

    @tupac = Passenger.create!(name: "Tupac", age: 24)
    @wayne = Passenger.create!(name: "Wayne", age: 21)

    @fp1 = PassengerFlight.create!(flight_id: @flight1.id, passenger_id: @tupac.id)
    @fp2 = PassengerFlight.create!(flight_id: @flight1.id, passenger_id: @wayne.id)
  end

  describe 'User Story 1' do
    it 'visits flights index page and shows a list of all flight numbers' do
      visit flights_path
      expect(current_path).to eq(flights_path)

      within "div.flights" do
        expect(page).to have_content(@flight1.number)
      end
    end

    it 'next to each flight number, it shows the arline of that flight' do
      visit flights_path
      expect(current_path).to eq(flights_path)

      within "div.flights" do
        expect(page).to have_content(@flight1.airline.name)
      end
    end

    it 'under each flight number it lists all passengers on that flight' do
      visit flights_path
      expect(current_path).to eq(flights_path)
      save_and_open_page
      within "div.passengers" do
        expect(page).to have_content(@tupac.name)
        expect(page).to have_content(@wayne.name)
      end
    end
  end
end

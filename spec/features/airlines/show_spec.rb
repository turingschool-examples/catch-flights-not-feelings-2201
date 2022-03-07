require 'rails_helper'

RSpec.describe 'Airline Show Page' do
  before(:each) do
    @jetblue = Airline.create!(name: "JetBlue")

    @flight1 = @jetblue.flights.create!(number: "1", date: "01/01/2022", departure_city: "Miami", arrival_city: "Dallas", airline_id: @jetblue.id)
    @flight2 = @jetblue.flights.create!(number: "2", date: "01/10/2022", departure_city: "New Orleans", arrival_city: "Los Angeles", airline_id: @jetblue.id)
    @flight3 = @jetblue.flights.create!(number: "3", date: "01/20/2022", departure_city: "Los Angeles", arrival_city: "London", airline_id: @jetblue.id)

    @tupac = Passenger.create!(name: "Tupac", age: 24)
    @biggie = Passenger.create!(name: "Biggie", age: 17)
    @wayne = Passenger.create!(name: "Wayne", age: 21)
    @nipsey = Passenger.create!(name: "Nipsey", age: 21)

    @fp1 = PassengerFlight.create!(flight_id: @flight1.id, passenger_id: @tupac.id)
    @fp2 = PassengerFlight.create!(flight_id: @flight1.id, passenger_id: @wayne.id)
    @fp3 = PassengerFlight.create!(flight_id: @flight2.id, passenger_id: @wayne.id)
    @fp4 = PassengerFlight.create!(flight_id: @flight2.id, passenger_id: @biggie.id)
    @fp5 = PassengerFlight.create!(flight_id: @flight3.id, passenger_id: @tupac.id)
    @fp6 = PassengerFlight.create!(flight_id: @flight3.id, passenger_id: @nipsey.id)
    @fp7 = PassengerFlight.create!(flight_id: @flight3.id, passenger_id: @wayne.id)
  end

  describe 'User Story 3/Extension' do
    it 'airline show page has a list of unique passengers - ordered by most flights' do
      visit airline_path(@jetblue)
      expect(current_path).to eq(airline_path(@jetblue))

      within "div.passenger0" do
        expect(page).to have_content(@wayne.name)
      end

      within "div.passenger1" do
        expect(page).to have_content(@tupac.name)
      end

      within "div.passenger2" do
        expect(page).to have_content(@nipsey.name)
      end
    end

    it 'only shows adults' do
      visit airline_path(@jetblue)
      expect(current_path).to eq(airline_path(@jetblue))

      within "div.all_passengers" do
        expect(page).to_not have_content(@biggie.name)
      end
    end
  end
end

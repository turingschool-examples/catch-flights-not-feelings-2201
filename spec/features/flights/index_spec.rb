require 'rails_helper'
RSpec.describe 'flights index page' do
  before :each do 
    @airline_1 = Airline.create(name: 'united')
    @airline_2 = Airline.create(name: 'southwest')
    @flight_1a = @airline_1.flights.create!(number: 1, date: '01-02-2000', departure_city: 'Los Angeles', arrival_city: 'Chicago')
    @flight_1b = @airline_1.flights.create!(number: 2, date: '01-03-2000', departure_city: 'Denver', arrival_city: 'Chicago')
    @flight_2a = @airline_2.flights.create!(number: 3, date: '01-04-2000', departure_city: 'Stockholm', arrival_city: 'Chicago')
    @passenger_1 = Passenger.create!(name: 'Bob Dylan', age: 40)
    @passenger_2 = Passenger.create!(name: 'Danny Devito', age: 20)
    @passenger_3 = Passenger.create!(name: 'John Lennon', age: 30)
    @passenger_4 = Passenger.create!(name: 'Paul McCartney', age: 17)
    @passenger_flight_1 = PassengerFlight.create!(passenger_id: @passenger_1.id, flight: @flight_1a)
    @passenger_flight_2 = PassengerFlight.create!(passenger_id: @passenger_2.id, flight: @flight_2a)
    @passenger_flight_3 = PassengerFlight.create!(passenger_id: @passenger_3.id, flight: @flight_2a)
    @passenger_flight_4 = PassengerFlight.create!(passenger_id: @passenger_4.id, flight: @flight_2a)
  end
  it "will displays all flight numbers, that flight's airline name, and the name of all of that flight's passengers" do
    visit "/flights"
    within ".flight-#{@flight_1a.id}" do
      expect(page).to have_content(@flight_1a.number)
      expect(page).to_not have_content(@flight_2a.number)
      expect(page).to_not have_content(@flight_1b.number)

      expect(page).to have_content(@airline_1.name)
      expect(page).to_not have_content(@airline_2.name)

      expect(page).to have_content(@passenger_1.name)
      expect(page).to_not have_content(@passenger_2.name)
      expect(page).to_not have_content(@passenger_3.name)
      expect(page).to_not have_content(@passenger_4.name)
    end
      within ".flight-#{@flight_2a.id}" do
      expect(page).to have_content(@flight_2a.number)
      expect(page).to_not have_content(@flight_1a.number)
      expect(page).to_not have_content(@flight_1b.number)

      expect(page).to have_content(@airline_2.name)
      expect(page).to_not have_content(@airline_1.name)

      expect(page).to_not have_content(@passenger_1.name)
      expect(page).to have_content(@passenger_2.name)
      expect(page).to have_content(@passenger_3.name)
      expect(page).to have_content(@passenger_4.name)
      end
  end
  it "has a link that removes a certain passenger from a certain flight next to each passenger" do
    visit "/flights"
    within ".flight-#{@flight_2a.id}" do

      within ".passenger-#{@passenger_2.id}" do
        expect(page).to have_link("Remove #{@passenger_2.name}")
        expect(page).to_not have_link("Remove #{@passenger_3.name}")
      end
      within ".passenger-#{@passenger_3.id}" do
        expect(page).to_not have_link("Remove #{@passenger_2.name}")
        expect(page).to have_link("Remove #{@passenger_3.name}")
      end
    end
  end
  it 'will remove a passenger from a flight' do 
      visit "/flights"
    within ".flight-#{@flight_2a.id}" do
      within ".passenger-#{@passenger_2.id}" do
        expect(page).to have_link("Remove #{@passenger_2.name}")
        click_link("Remove #{@passenger_2.name}")
      end
    end
    expect(current_path).to eq("/flights")
    within ".flight-#{@flight_2a.id}" do 
      expect(page).to_not have_content(@passenger_2.name)
    end
  end
end
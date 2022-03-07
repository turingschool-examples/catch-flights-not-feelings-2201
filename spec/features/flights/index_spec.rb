require 'rails_helper'

RSpec.describe 'Flights Index' do 
    before(:each) do 
        @united = Airline.create!(name: 'United')
        @southwest = Airline.create!(name: 'Southwest')

        @flight_1 = Flight.create!(number: 1, date: '01-02-2000', departure_city: 'Houston', arrival_city: 'Los Angeles', airline: @united)
        @flight_2 = Flight.create!(number: 2, date: '04-02-2000', departure_city: 'San Antonio', arrival_city: 'New York', airline: @united)
        @flight_3 = Flight.create!(number: 3, date: '07-02-2000', departure_city: 'San Francisco', arrival_city: 'Chicago', airline: @southwest)
        @passenger_1 = Passenger.create!(name: 'bob', age: 7)
        @flight_1.add_passenger(@passenger_1)
        @passenger_2 = Passenger.create!(name: 'sam', age: 10)
        @flight_2.add_passenger(@passenger_2)
        @passenger_3 = Passenger.create!(name: 'john', age: 12)
        @flight_3.add_passenger(@passenger_3)
    end
    it 'show the flight number for every flight' do 
        visit(flights_path)
        within "#flight-#{@flight_1.number}" do 
            expect(page).to have_content(@flight_1.number)
        end
        within "#flight-#{@flight_2.number}" do 
            expect(page).to have_content(@flight_2.number)
        end
        within "#flight-#{@flight_3.number}" do 
            expect(page).to have_content(@flight_3.number)
        end
    end
    it 'will list the passengers for each flight' do 
        visit(flights_path)
        within "#flight-#{@flight_1.number}" do 
            expect(page).to have_content(@passenger_1.name)
            expect(page).to_not have_content(@passenger_2.name)
            expect(page).to_not have_content(@passenger_3.name)
        end
        within "#flight-#{@flight_2.number}" do 
            expect(page).to have_content(@passenger_2.name)
        end
        within "#flight-#{@flight_3.number}" do 
            expect(page).to have_content(@passenger_3.name)
        end
    end
    it 'can remove a passenger from a flight without destroying passenger record' do 
        visit(flights_path)
        within "#flight-#{@flight_1.number}" do 
            expect(page).to have_content(@passenger_1.name)
            expect(page).to have_button("Remove Passenger")
            click_button("Remove Passenger")
        end
        expect(current_path).to eq(flights_path)
        expect(page).to_not have_content(@passenger_1.name)
        expect(@passenger_1.valid?).to be true
    end
end
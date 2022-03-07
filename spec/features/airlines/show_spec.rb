require 'rails_helper'

RSpec.describe 'Airline Show Page' do 
    before :each do 
        @united = Airline.create!(name: 'United')
        @southwest = Airline.create!(name: 'Southwest')

        @flight_1 = Flight.create!(number: 1, date: '01-02-2000', departure_city: 'Houston', arrival_city: 'Los Angeles', airline: @united)
        @flight_2 = Flight.create!(number: 2, date: '04-02-2000', departure_city: 'San Antonio', arrival_city: 'New York', airline: @united)
        @flight_3 = Flight.create!(number: 3, date: '07-02-2000', departure_city: 'San Francisco', arrival_city: 'Chicago', airline: @united)
        @flight_4 = Flight.create!(number: 3, date: '07-05-2000', departure_city: 'San Francisco', arrival_city: 'NY', airline: @southwest)
        @baby_1 = Passenger.create!(name: 'Bob', age: 7)
        @flight_1.add_passenger(@baby_1)
        @adult_1 = Passenger.create!(name: 'Sam', age: 18)
        @flight_2.add_passenger(@adult_1)
        @adult_2 = Passenger.create!(name: 'John', age: 22)
        @flight_3.add_passenger(@adult_2)
        @adult_3 = Passenger.create!(name: 'Mike', age: 30)
        @flight_4.add_passenger(@adult_3)
    end
    it 'will list passengers that have flights on an airline' do 
        visit(airline_path(@united))
        expect(page).to have_content(@adult_1.name)
        expect(page).to have_content(@adult_2.name)
    end
    it 'will only list passengers once' do 
        @flight_3.add_passenger(@adult_1)
        visit(airline_path(@united))
        within "#passengers" do 
            expect(page).to have_content(@adult_1.name, count: 1)
        end
    end
    it 'will not list passengers under 18' do 
        visit(airline_path(@united))
        expect(page).to_not have_content(@baby_1.name)
    end
end
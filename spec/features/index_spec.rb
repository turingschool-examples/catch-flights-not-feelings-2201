require 'rails_helper'

RSpec.describe 'Flight Index Page', type: :feature do

  before :each do
    @pass1 = Passenger.create!(name:'Sue', age: 52)
    @pass2 = Passenger.create!(name:'Crystal', age: 13)
    @pass3 = Passenger.create!(name:'Ammon', age: 44)
    @pass4 = Passenger.create!(name:'Jill', age: 34)
    @pass5 = Passenger.create!(name:'Bob', age: 22)
    @air1 = Airline.create!(name: 'Fly')
    @air2 = Airline.create!(name: 'High')
    @flight1 = Flight.create!(number: '1', date: '01/02', departure_city: 'MEX', arrival_city: 'BOS', airline_id: @air1.id )
    @flight2 = Flight.create!(number: '2', date: '02/02', departure_city: 'LAX', arrival_city: 'MUM', airline_id: @air2.id )
    @flight3 = Flight.create!(number: '3', date: '03/03', departure_city: 'LGA', arrival_city: 'DAI', airline_id: @air1.id )
    @flight4 = Flight.create!(number: '4', date: '04/04', departure_city: 'NYC', arrival_city: 'FUN', airline_id: @air2.id )
    PassengerFlight.create!(passenger_id: @pass1.id, flight_id: @flight1.id)
    PassengerFlight.create!(passenger_id: @pass1.id, flight_id: @flight3.id)
    PassengerFlight.create!(passenger_id: @pass2.id, flight_id: @flight2.id)
    PassengerFlight.create!(passenger_id: @pass2.id, flight_id: @flight4.id)
    PassengerFlight.create!(passenger_id: @pass3.id, flight_id: @flight1.id)
    PassengerFlight.create!(passenger_id: @pass4.id, flight_id: @flight1.id)
    PassengerFlight.create!(passenger_id: @pass5.id, flight_id: @flight1.id)
    PassengerFlight.create!(passenger_id: @pass5.id, flight_id: @flight3.id)
    PassengerFlight.create!(passenger_id: @pass5.id, flight_id: @flight4.id)

  end

  describe 'index page will display attributes' do

    it 'will display flight numbers with the airline name and coorsponding passengers' do
      visit flights_path
save_and_open_page
      within("#flight-0") do

        expect(page).to have_content(@flight1.number)
        expect(page).to have_content(@flight1.airline_name)
        expect(page).to have_content(@pass1.name)
        expect(page).to have_content(@pass3.name)
        expect(page).to have_content(@pass4.name)

        expect(page).to_not have_content(@flight2.number)
      end

      within("#flight-1") do

        expect(page).to have_content(@flight2.number)
        expect(page).to have_content(@flight2.airline_name)
        expect(page).to have_content(@pass2.name)

        expect(page).to_not have_content(@flight3.number)
      end

      within("#flight-2") do

        expect(page).to have_content(@flight3.number)
        expect(page).to have_content(@flight3.airline_name)
        expect(page).to have_content(@pass1.name)
        expect(page).to have_content(@pass5.name)

        expect(page).to_not have_content(@flight2.number)
      end

      within("#flight-3") do

        expect(page).to have_content(@flight4.number)
        expect(page).to have_content(@flight4.airline_name)
        expect(page).to have_content(@pass2.name)
        expect(page).to have_content(@pass5.name)

        expect(page).to_not have_content(@flight2.number)
      end
    end
  end
end
# end
# expect(page).to have_link()
#
# expect(current_path).to eq()

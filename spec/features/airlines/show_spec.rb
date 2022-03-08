require 'rails_helper'

RSpec.describe 'Airline Show Page', type: :feature do

  before :each do
    @pass1 = Passenger.create!(name:'Sue', age: 52)
    @pass2 = Passenger.create!(name:'Crystal', age: 13)
    @pass3 = Passenger.create!(name:'Ammon', age: 44)
    @pass4 = Passenger.create!(name:'Jill', age: 12)
    @pass5 = Passenger.create!(name:'Bob', age: 22)
    @air1 = Airline.create!(name: 'Fly')
    @air2 = Airline.create!(name: 'High')
    @flight1 = Flight.create!(number: '1', date: '01/02', departure_city: 'MEX', arrival_city: 'BOS', airline_id: @air1.id )
    @flight3 = Flight.create!(number: '3', date: '03/03', departure_city: 'LGA', arrival_city: 'DAI', airline_id: @air1.id )
    @flight2 = Flight.create!(number: '2', date: '02/02', departure_city: 'LAX', arrival_city: 'MUM', airline_id: @air2.id )
    @flight4 = Flight.create!(number: '4', date: '04/04', departure_city: 'NYC', arrival_city: 'FUN', airline_id: @air2.id )
    PassengerFlight.create!(passenger_id: @pass1.id, flight_id: @flight1.id)
    PassengerFlight.create!(passenger_id: @pass3.id, flight_id: @flight1.id)
    PassengerFlight.create!(passenger_id: @pass4.id, flight_id: @flight1.id)
    PassengerFlight.create!(passenger_id: @pass5.id, flight_id: @flight1.id)
    PassengerFlight.create!(passenger_id: @pass1.id, flight_id: @flight3.id)
    PassengerFlight.create!(passenger_id: @pass5.id, flight_id: @flight3.id)


    PassengerFlight.create!(passenger_id: @pass2.id, flight_id: @flight2.id)
    PassengerFlight.create!(passenger_id: @pass3.id, flight_id: @flight4.id)
    PassengerFlight.create!(passenger_id: @pass5.id, flight_id: @flight4.id)

  end

  describe 'show will display list of passengers ' do

    it 'will display a unique list of adult passengers ' do
      visit airline_path(@air1)

      expect(page).to have_content(@air1.name)
      expect(page).to have_content(@pass1.name)
      expect(page).to have_content(@pass1.age)
      expect(page).to have_content(@pass3.name)
      expect(page).to have_content(@pass3.age)
      expect(page).to have_content(@pass5.name)
      expect(page).to have_content(@pass5.age)

      expect(page).to_not have_content(@pass4.name)
      expect(page).to_not have_content(@pass4.age)
    end

    it 'will display a unique list of adult passengers ' do
      visit airline_path(@air2)

      expect(page).to have_content(@air2.name)
      expect(page).to have_content(@pass3.name)
      expect(page).to have_content(@pass5.name)

      expect(page).to_not have_content(@pass2.name)
      expect(page).to_not have_content(@pass2.age)
      end
    end
  end

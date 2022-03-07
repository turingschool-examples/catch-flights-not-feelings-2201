require 'rails_helper'


describe "index page" do

  before(:each) do
    @joeline = Airline.create!(name: "The Joeline")

    @flight1 = @joeline.flights.create!(number: '123', date: '01/03/2021', arrival_city: "westminster", departure_city: "denver")
    @flight2 = @joeline.flights.create!(number: '321', date: '01/03/2021', arrival_city: "westminster", departure_city: "denver")
    @flight3 = @joeline.flights.create!(number: '456', date: '01/03/2021', arrival_city: "westminster", departure_city: "denver")
    @flight4 = @joeline.flights.create!(number: '654', date: '01/03/2021', arrival_city: "westminster", departure_city: "denver")

    @person1 = Passenger.create!(name: "joseph", age: 43)
    @person2 = Passenger.create!(name: "je", age: 22)
    @person3 = Passenger.create!(name: "ej", age: 120)
    @person4 = Passenger.create!(name: "moj", age: 5)
    @person_flight1 = PassengerFlight.create!(flight_id: @flight1.id, passenger_id: @person1.id)
    @person_flight2 = PassengerFlight.create!(flight_id: @flight1.id, passenger_id: @person2.id)
    @person_flight3 = PassengerFlight.create!(flight_id: @flight1.id, passenger_id: @person3.id)
    @person_flight4 = PassengerFlight.create!(flight_id: @flight1.id, passenger_id: @person4.id)
    @person_flight5 = PassengerFlight.create!(flight_id: @flight2.id, passenger_id: @person1.id)
    @person_flight6 = PassengerFlight.create!(flight_id: @flight2.id, passenger_id: @person2.id)
    @person_flight7 = PassengerFlight.create!(flight_id: @flight1.id, passenger_id: @person3.id)
    @person_flight8 = PassengerFlight.create!(flight_id: @flight1.id, passenger_id: @person4.id)
  end

    it "has an airline index page" do
      visit "/airlines/#{@joeline.id}"
      #save_and_open_page
      expect(page).to have_content("Airlines name is #{@joeline.name}.")
    end

    it "lists distinct passengers over 18" do
      visit "/airlines/#{@joeline.id}"

      within("#peeps") do
        expect(page).to_not have_content("#{@person4.name}")
      end
    end

    it "lists distinct passengers over 18" do
      visit "/airlines/#{@joeline.id}"

      within("#peeps") do
        expect(page).to have_content("#{@person1.name}")
        expect(page).to have_content("#{@person2.name}")
        expect(page).to have_content("#{@person3.name}")
      end
    end

end

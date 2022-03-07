require 'rails_helper'


describe "index page" do

  before(:each) do
    @joeline = Airline.create!(name: "The Joeline")

    @flight1 = @joeline.flights.create!(number: '123', date: '01/03/2021', arrival_city: "westminster", departure_city: "denver")

    @person1 = Passenger.create!(name: "joseph", age: 43)
    @person2 = Passenger.create!(name: "joe2", age: 43)
    @person_flight1 = PassengerFlight.create!(flight_id: @flight1.id, passenger_id: @person1.id)
    @person_flight2 = PassengerFlight.create!(flight_id: @flight1.id, passenger_id: @person2.id)
  end

  it "checks the index page for stuff" do
    visit "/flights"

    expect(page).to have_content(@flight1.number)
    expect(page).to have_content(@person1.name)
  end

  it "removes a passenger from the passenger list" do
    visit "/flights"
    within("#delete1") do
      click_button('remove passenger')
      
      expect(page).to_not have_content(@person1.name)
    end

  end

end

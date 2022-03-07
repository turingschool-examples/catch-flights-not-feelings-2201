require 'rails_helper'

RSpec.describe 'The Airline Show Page' do
  before(:each) do
    @airline1 = Airline.create!(name: "Southwest")
    @flight1 = @airline1.flights.create!(number: 123,
                                        date: "12/12/21",
                                        departure_city: "DEN",
                                        arrival_city: "SJC")
    @flight2 = @airline1.flights.create!(number: 586,
                                        date: "12/24/21",
                                        departure_city: "SFO",
                                        arrival_city: "ELP")
    @flight3 = @airline1.flights.create!(number: 842,
                                        date: "12/29/21",
                                        departure_city: "SAC",
                                        arrival_city: "PHX")
    @passenger1 = Passenger.create!(name: "Cole", age: 36)
    @passenger2 = Passenger.create!(name: "Kendra", age: 35)
    @passenger3 = Passenger.create!(name: "Landon", age: 12)
    @passenger4 = Passenger.create!(name: "Tim", age: 45)
    @flight_passenger1 = FlightPassenger.create!(passenger_id: @passenger1.id,
                                                flight_id: @flight1.id)
    @flight_passenger2 = FlightPassenger.create!(passenger_id: @passenger2.id,
                                                flight_id: @flight1.id)
    @flight_passenger3 = FlightPassenger.create!(passenger_id: @passenger3.id,
                                                flight_id: @flight2.id)
    @flight_passenger4 = FlightPassenger.create!(passenger_id: @passenger4.id,
                                                flight_id: @flight2.id)
    @flight_passenger5 = FlightPassenger.create!(passenger_id: @passenger4.id,
                                                flight_id: @flight3.id)

    visit airline_path(@airline1)
  end

  it "has a unique list of all its passenger's names over 18" do
    expect(page).to have_content(@passenger1.name)
    expect(page).to have_content(@passenger2.name)
    expect(page).to_not have_content(@passenger3.name)
    expect(page).to_not have_content(@passenger4.name)
  end

end

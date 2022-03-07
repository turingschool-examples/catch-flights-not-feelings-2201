require 'rails_helper'

RSpec.describe 'flight index page' do
  before(:each) do
    @airline1 = Airline.create(name: "JetBlue")
    @airline2 = Airline.create(name: "Southwest")
    @airline3 = Airline.create(name: "United")

    @flight1 = Flight.create(number: "7990", date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas", airline_id: 1)
    @flight2 = Flight.create(number: "3940", date: "3/10/2022", departure_city: "Detroit", arrival_city: "Orlando", airline_id: 1)
    @flight3 = Flight.create(number: "9091", date: "5/17/2022", departure_city: "Chicago", arrival_city: "Kansas City", airline_id: 2)
    @flight4 = Flight.create(number: "6798", date: "10/9/2022", departure_city: "Tulsa", arrival_city: "Fresno", airline_id: 3)
    @flight5 = Flight.create(number: "9665", date: "11/22/2022", departure_city: "Durham", arrival_city: "New Orleans", airline_id: 3)

    @passenger1  = Passenger.create(name: "Pabu", age: 20)
    @passenger2  = Passenger.create(name: "Thor", age: 15)
    @passenger3  = Passenger.create(name: "Loki", age: 19)
    @passenger4  = Passenger.create(name: "Apollo", age: 14)
    @passenger5  = Passenger.create(name: "Ian", age: 18)

    visit flights_path
  end
  it 'shows every flight number' do
    expect(page).to have_content(@flight1.number)
    expect(page).to have_content(@flight2.number)
    expect(page).to have_content(@flight3.number)
    expect(page).to have_content(@flight4.number)
    expect(page).to have_content(@flight5.number)
  end
  it 'shows every airline name' do
    expect(page).to have_content(@airline1.name)
    expect(page).to have_content(@airline2.name)
    expect(page).to have_content(@airline3.name)
  end
end

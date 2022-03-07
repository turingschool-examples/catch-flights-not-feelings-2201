require 'rails_helper'

RSpec.describe 'flights index' do 
  before(:each) do 
    @airline1 = Airline.create!(name: "American")
    @airline2 = Airline.create!(name: "Delta")
    @airline3 = Airline.create!(name: "JetBlue")
    @airline4 = Airline.create!(name: "Southwest")
    @airline5 = Airline.create!(name: "United")

    @flight1 = Flight.create!(number: 7990, date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas", airline: @airline1)
    @flight2 = Flight.create!(number: 3940, date: "3/10/2022", departure_city: "Detroit", arrival_city: "Orlando", airline: @airline1)
    @flight3 = Flight.create!(number: 9091, date: "5/17/2022", departure_city: "Chicago", arrival_city: "Kansas City", airline: @airline2)
    @flight4 = Flight.create!(number: 6798, date: "10/9/2022", departure_city: "Tulsa", arrival_city: "Fresno", airline: @airline2)
    @flight5 = Flight.create!(number: 9665, date: "11/22/2022", departure_city: "Durham", arrival_city: "New Orleans", airline: @airline3)

    @passenger1 = Passenger.create!(name: "Tina Belcher", age: 13)
    @passenger2 = Passenger.create!(name: "Louise Belcher", age: 9)
    @passenger3 = Passenger.create!(name: "Bob Belcher", age: 46)
    @passenger4 = Passenger.create!(name: "Linda Belcher", age: 44)
    @passenger5 = Passenger.create!(name: "Big Bob", age: 84)

    @fp1 = FlightPassenger.create!(flight: @flight1, passenger: @passenger1)
    @fp2 = FlightPassenger.create!(flight: @flight1, passenger: @passenger2)
    @fp3 = FlightPassenger.create!(flight: @flight2, passenger: @passenger1)
    @fp4 = FlightPassenger.create!(flight: @flight2, passenger: @passenger3)
    @fp5 = FlightPassenger.create!(flight: @flight3, passenger: @passenger4)
    @fp6 = FlightPassenger.create!(flight: @flight4, passenger: @passenger4)
    @fp7 = FlightPassenger.create!(flight: @flight5, passenger: @passenger5)
    visit flights_path
  end
  it 'has a list of all flight numbers' do 
    expect(page).to have_content(@flight1.number)
    expect(page).to have_content(@flight2.number)
    expect(page).to have_content(@flight3.number)
    expect(page).to have_content(@flight4.number)
    expect(page).to have_content(@flight5.number)
    expect(page).to_not have_content(@flight5.date)
    expect(page).to_not have_content(@flight4.departure_city)
    expect(page).to_not have_content(@flight3.arrival_city)
  end

  it 'has name of airline next to each flight number for that flight' do 
    within "#flight-#{@flight1.id}" do 
      expect(page).to have_content(@flight1.airline.name)
      expect(page).to_not have_content(@airline4.name)
    end
    within "#flight-#{@flight2.id}" do 
      expect(page).to have_content(@flight2.airline.name)
      expect(page).to_not have_content(@airline4.name)
    end
    within "#flight-#{@flight3.id}" do 
      expect(page).to have_content(@flight3.airline.name)
    end
    within "#flight-#{@flight4.id}" do 
      expect(page).to have_content(@flight4.airline.name)
    end
    within "#flight-#{@flight5.id}" do 
      expect(page).to have_content(@flight5.airline.name)
    end
  end

  it 'has names of each passenger on a flight under each flight number' do 
    within "#flight-#{@flight1.id}" do 
      expect(page).to have_content(@passenger1.name)
      expect(page).to have_content(@passenger2.name)
      expect(page).to_not have_content(@passenger3.name)
    end
    within "#flight-#{@flight2.id}" do 
      expect(page).to have_content(@passenger1.name)
      expect(page).to have_content(@passenger3.name)
      expect(page).to_not have_content(@passenger2.name)
    end
    within "#flight-#{@flight3.id}" do 
      expect(page).to have_content(@passenger4.name)
      expect(page).to_not have_content(@passenger3.name)
    end
    within "#flight-#{@flight4.id}" do 
      expect(page).to have_content(@passenger4.name)
      expect(page).to_not have_content(@passenger3.name)
    end
    within "#flight-#{@flight5.id}" do 
      expect(page).to have_content(@passenger5.name)
      expect(page).to_not have_content(@passenger3.name)
    end
  end
end 
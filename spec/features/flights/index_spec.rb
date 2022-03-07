require 'rails_helper'

RSpec.describe 'flight index' do
  it 'displays all flight numbers' do
    airline1 = Airline.create!(name: "Spirit")

    flight1 = Flight.create!(number: "123", date: "01/01/1999", departure_city: "Denver", arrival_city: "Austin", airline_id: airline1.id)
    flight2 = Flight.create!(number: "456", date: "01/01/1999", departure_city: "Wonderland", arrival_city: "London", airline_id: airline1.id)

    passenger1 = flight1.passengers.create!(name: "Bob", age: 6)
    passenger2 = flight1.passengers.create!(name: "May", age: 30)
    passenger3 = flight1.passengers.create!(name: "George", age: 50)

    passenger4 = flight2.passengers.create!(name: "Elmo", age: 10)
    passenger5 = flight2.passengers.create!(name: "Daniel", age: 20)
    passenger6 = flight2.passengers.create!(name: "Mike", age: 40)


    visit "/flights"

    expect(page).to have_content(flight1.number)
    expect(page).to have_content(flight2.number)
    expect(page).to have_content(flight1.airline.name)
    expect(page).to have_content(flight2.airline.name)

    within "#flight-#{flight1.id}" do
      expect(page).to have_content(passenger1.name)
      expect(page).to have_content(passenger2.name)
      expect(page).to have_content(passenger3.name)
    end

    within "#flight-#{flight2.id}" do
      expect(page).to have_content(passenger4.name)
      expect(page).to have_content(passenger5.name)
      expect(page).to have_content(passenger6.name)
    end
  end

  it 'can remove passenger from flight' do
    airline1 = Airline.create!(name: "Spirit")

    flight1 = Flight.create!(number: "123", date: "01/01/1999", departure_city: "Denver", arrival_city: "Austin", airline_id: airline1.id)
    flight2 = Flight.create!(number: "456", date: "01/01/1999", departure_city: "Wonderland", arrival_city: "London", airline_id: airline1.id)

    passenger1 = flight1.passengers.create!(name: "Bob", age: 6)
    passenger2 = flight1.passengers.create!(name: "May", age: 30)
    passenger3 = flight1.passengers.create!(name: "George", age: 50)

    passenger4 = flight2.passengers.create!(name: "Elmo", age: 10)
    passenger5 = flight2.passengers.create!(name: "Daniel", age: 20)
    passenger6 = flight2.passengers.create!(name: "Mike", age: 40)

    visit '/flights'

    within "#passenger-#{passenger4.id}" do
      click_link "Remove this passenger from flight"
    end

    expect(current_path).to eq('/flights')
    expect(page).not_to have_content(passenger4.name)
  end
end

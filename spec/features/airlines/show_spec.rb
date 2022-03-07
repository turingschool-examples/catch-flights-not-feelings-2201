require 'rails_helper'

RSpec.describe "Airline Show Page" do
  describe 'When I visit the Airline Show page,' do
    xit "I see a unique list of passengers(no duplicates) that only includes adults" do
      airline = Airline.create!(name: "American")
      flight1 = airline.flights.create!(number: "7990", date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas")
      flight2 = airline.flights.create!(number: "3940", date: "3/10/2022", departure_city: "Detroit", arrival_city: "Orlando")

      passenger1 = flight1.passengers.create!(name: 'Tina Belcher', age: 13)
      passenger2 = flight1.passengers.create!(name: 'Loiuse Belcher', age: 9)
      passenger3 = flight2.passengers.create!(name: 'Bob Belcher', age: 46)
      passenger4 = flight2.passengers.create!(name: 'Linda Belcher', age: 44)
      passenger5 = flight1.passengers.create!(name: 'Big Bob', age: 84)
      passenger6 = flight2.passengers.create!(name: 'Big Bob', age: 84)

      visit "/airlines/#{airline.id}"

      expect(page).to have_content(passenger3.name)
      expect(page).to have_content(passenger4.name)
      expect(page).to have_content(passenger5.name)
    end



  end
end

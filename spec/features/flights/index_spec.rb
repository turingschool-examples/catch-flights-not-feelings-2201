require 'rails_helper'

RSpec.describe "Flights Index Page" do
  describe 'When I visit the Flights index page,' do
    it "I see a list of all flight numbers" do
      airline = Airline.create!(name: "American")
      flight1 = airline.flights.create!(number: "7990", date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas")
      flight2 = airline.flights.create!(number: "3940", date: "3/10/2022", departure_city: "Detroit", arrival_city: "Orlando")
      flight3 = airline.flights.create!(number: "9091", date: "5/17/2022", departure_city: "Chicago", arrival_city: "Kansas City")
      flight4 = airline.flights.create!(number: "6798", date: "10/9/2022", departure_city: "Tulsa", arrival_city: "Fresno")
      flight5 = airline.flights.create!(number: "9665", date: "11/22/2022", departure_city: "Durham", arrival_city: "New Orleans")

      visit '/flights'

      expect(page).to have_content(flight1.number)
      expect(page).to have_content(flight2.number)
      expect(page).to have_content(flight3.number)
      expect(page).to have_content(flight4.number)
      expect(page).to have_content(flight5.number)
    end

    it "next to each flight number, I see the name of the airline of the flight" do
      airline = Airline.create!(name: "American")
      airline2 = Airline.create!(name: "Delta")
      flight1 = airline.flights.create!(number: "7990", date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas")
      flight3 = airline2.flights.create!(number: "3940", date: "3/10/2022", departure_city: "Detroit", arrival_city: "Orlando")
      flight4 = airline2.flights.create!(number: "3940", date: "3/10/2022", departure_city: "Detroit", arrival_city: "Orlando")

      visit '/flights'

      within "div.flight_#{flight1.id}" do
        expect(page).to have_content(airline.name)
      end

      within "div.flight_#{flight3.id}" do
        expect(page).to have_content(airline2.name)
      end

      within "div.flight_#{flight4.id}" do
        expect(page).to_not have_content(airline.name)
      end
    end

    it "under each flight number, I see the names of all that flights passengers" do

    end
  end
end

class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @airlines = Airline.all
  end
end

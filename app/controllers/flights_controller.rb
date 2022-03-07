class FlightsController < ApplicationController
  def index
    @airlines = Airline.all
    @flights = Flight.all
  end
end

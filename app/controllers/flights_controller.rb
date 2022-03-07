class FlightsController < ApplicationController
  before_action :set_flights, only: [:index]

  def index

  end

  private

  def set_flights
    @flights = Flight.all
  end
end

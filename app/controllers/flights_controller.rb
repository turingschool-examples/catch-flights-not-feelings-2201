class FlightsController < ApplicationController

  def index
    @flights = Flight.all
  end

  def delete
    flight = PassengerFlight.find(params[:id])
    flight.destroy
    redirect_to '/flights'
  end
end

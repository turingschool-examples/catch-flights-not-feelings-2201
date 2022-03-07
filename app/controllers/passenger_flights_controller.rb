class PassengerFlightsController < ApplicationController

  def destroy
    pass_flight = PassengerFlight.find[params[:id].destroy
    redirect_to flights_path
  end


end

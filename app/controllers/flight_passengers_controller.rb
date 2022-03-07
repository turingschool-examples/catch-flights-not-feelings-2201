class FlightPassengersController < ApplicationController
  def destroy
    ticket =  FlightPassenger.find_by(flight_id: params[:flight_id], passenger_id: params[:id])
    ticket.destroy
    redirect_to "/flights"
  end
end

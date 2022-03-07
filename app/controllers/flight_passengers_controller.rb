class FlightPassengersController < ApplicationController
  def destroy
    FlightPassenger.find_and_delete(params[:flight_id], params[:passenger_id])
    redirect_to "/flights"
  end
end

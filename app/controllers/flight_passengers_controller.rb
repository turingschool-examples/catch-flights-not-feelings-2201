class FlightPassengersController < ApplicationController
  def destroy
    connection = FlightPassenger.find_by(passenger_id: params[:passenger_id], flight_id: params[:flight_id])
    connection.destroy
    redirect_to "/flights"
  end
end

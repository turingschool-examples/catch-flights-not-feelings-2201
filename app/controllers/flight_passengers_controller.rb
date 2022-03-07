class FlightPassengersController < ApplicationController

  def destroy
    fp = FlightPassenger.find_record(params[:flight_id], params[:passenger_id])
    fp.destroy
    redirect_to flights_path
  end
end
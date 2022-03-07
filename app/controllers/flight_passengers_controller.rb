class FlightPassengersController < ApplicationController

  def destroy 
    # Need to refactor link to also pass params for flight_id to make sure correct joins row is destroyed
    FlightPassenger.find_by(passenger_id: params[:id]).destroy
    redirect_to flights_path
  end 
end 
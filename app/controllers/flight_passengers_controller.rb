class FlightPassengersController < ApplicationController

  def destroy  
    FlightPassenger.find_by(passenger_id: params[:id], flight_id: params[:flight_id]).destroy
    redirect_to flights_path
  end 
end 
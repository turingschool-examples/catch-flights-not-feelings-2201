class FlightPassengersController < ApplicationController
  def destroy
    flight_passenger = FlightPassenger.find_by(passenger_id:(params[:id]),
                                              flight_id:(params[:format]))
    flight_passenger.delete
    redirect_to flights_path(params[:format])
  end


end

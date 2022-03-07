class FlightPassengersController < ApplicationController
  def destroy
    FlightPassenger.find_and_delete(:flight_id, :passenger_id)
    redirect_to "/flights"
  end
end

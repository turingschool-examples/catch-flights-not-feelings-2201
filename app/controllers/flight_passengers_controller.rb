class FlightPassengersController < ApplicationController
  def destroy
    flight_passenger = FlightPassenger.find_by(flight_id: params[:id], passenger_id: params[:format])
    flight_passenger.destroy
    redirect_to "/flights"
  end

end

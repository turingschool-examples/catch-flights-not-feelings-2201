class PassengerFlightsController < ApplicationController
  def destroy
    flight = Flight.find(params[:flight_id])
    # flight = Flight.find(params[:id])
    passenger = Passenger.find(params[:passenger_id])
    # passenger = Passenger.find(params[:id])
    # require "pry"; binding.pry
    passenger_f = PassengerFlight.find_by(passenger_flight)

    passenger_f.destroy
    redirect_to "/flights"
  end

  private
  def passenger_flight
    params.permit(flight_id: params[:flight_id], passenger_id: params[:passenger_id])
  end
end

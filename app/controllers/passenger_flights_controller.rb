class PassengerFlightsController < ApplicationController

  def destroy
    @passenger_flight = PassengerFlight.find_by(passenger_id: params[:id], flight_id: params[:flight_id])
    @passenger_flight.destroy
    redirect_to "/flights"
  end

end

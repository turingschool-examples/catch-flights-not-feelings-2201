class PassengerFlightsController < ApplicationController
  def destroy
    flight = Flight.find(params[:flight_id])
    passenger = Passenger.find(params[:passenger_id])
    passenger_flight = PassengerFlight.find_by(flight_id: params[:flight_id], passenger_id: params[:passenger_id])
    passenger_flight.destroy
    redirect_to "/flights"
  end
end

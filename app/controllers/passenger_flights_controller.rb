class PassengerFlightsController < ApplicationController

  def destroy
    @passenger = Passenger.find(params[:id])
    @flight = Flight.find(params[:flight_id])
    @passenger_flight = PassengerFlight.find(passenger_id: @passenger.id, flight_id: @flight.id)
    @passenger_flight.destroy
    redirect_to "/flights"
  end

end

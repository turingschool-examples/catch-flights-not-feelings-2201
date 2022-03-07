class PassengerFlightsController < ApplicationController
  def destroy
    @flight = Flight.find(params[:flight_id])
    # @flight = Flight.find(params[:id])
    # passenger = Passenger.find(params[:passenger_id])
    passenger = Passenger.find(params[:id])
  
  end
end

class PassengerFlightsController < ApplicationController
  
  def destroy
    # require 'pry'; binding.pry
    @passenger = PassengerFlight.find_by(passenger_id: params[:id], flight_id: params[:flight_id])
    @passenger.destroy
    redirect_to flights_path
  end
end
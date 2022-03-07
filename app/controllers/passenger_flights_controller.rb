class PassengerFlightsController < ApplicationController
  def delete
    PassengerFlight.find_by(passenger_id: params[:passenger_id], flight_id: params[:id]).destroy
    redirect_to "/flights"
  end
end

class PassengerFlightsController < ApplicationController
  def destroy
    PassengerFlight.where(passenger_id: params[:passenger_id], flight_id: params[:flight_id]).delete_all
    redirect_to "/flights"
  end
end


class PassengerFlightsController < ApplicationController
  def delete
    passenger = Passenger.find(params[:passenger_id])
    passenger.delete
    redirect_to "/flights"
  end
end

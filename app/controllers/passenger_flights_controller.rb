class PassengerFlightsController < ApplicationController
  def destroy
    ticket =  PassengerFlight.find_by(flight_id: params[:flight_id], passenger_id: params[:id])
    ticket.destroy
    redirect_to "/flights"
  end
end

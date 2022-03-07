class FlightsController < ApplicationController
  def index
    @flights = Flight.all
  end

  def destroy # This should be in its own appropriate controller I believe
    passenger = Passenger.find(params[:passenger_id])
    passenger.destroy

    redirect_to "/flights"
  end
end

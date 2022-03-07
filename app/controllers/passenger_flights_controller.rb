class PassengerFlightsController < ApplicationController
  before_action :set_passenger_flight, only: [:destroy]
  before_action :set_passenger, only: [:destroy]
  before_action :set_flight, only: [:destroy]

  def destroy
    if @pf.destroy
      flash[:notice] = "#{@passenger.name} has been removed from Flight No: #{@flight.number}"
      redirect_to flights_path
    else
      flash[:notice] = "Your request was invalid. Please try again"
      redirect_to flights_path
    end
  end

  private

  def set_passenger_flight
    @pf = PassengerFlight.find_by(
      flight_id: params[:format],
      passenger_id: params[:id]
    )
  end

  def set_passenger
    @passenger = Passenger.find_by(id: params[:id])
  end

  def set_flight
    @flight = Flight.find_by(id: params[:format])
  end
end

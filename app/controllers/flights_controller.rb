class FlightsController < ApplicationController
    def index 
        @flights = Flight.all
    end
    def destroy 
        flight = Flight.find(params[:flight_id])
        passenger = Passenger.find(params[:id])
        flight.remove_passenger(passenger)
        redirect_to(flights_path, notice: "Passenger Removed")
    end
end
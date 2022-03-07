class AirlinesController < ApplicationController
  
  def index
  end

  def show 
    @airline = Airline.find(params[:id])
    # @flights = @airline.flights
  end
end
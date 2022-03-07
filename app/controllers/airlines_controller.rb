class AirlinesController < ApplicationController
  before_action :set_airline, only: [:show]

  def show

  end

  private

  def set_airline
    @airline = Airline.find(params[:id])
  end
end

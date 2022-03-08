class Airline < ApplicationRecord
  has_many :flights
  has_many :passenger_flights, through: :flights
  has_many :passengers, through: :passenger_flights


  def adult_passengers
    self.passengers.where('age > 17').distinct
  end
end
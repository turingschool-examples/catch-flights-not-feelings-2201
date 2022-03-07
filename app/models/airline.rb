class Airline < ApplicationRecord
  has_many :flights
  has_many :passenger_flights, through: :flights
  has_many :passengers, through: :passenger_flights

  def list_all_adult_passengers
    self.passengers.where('age >= 18').distinct
  end
end

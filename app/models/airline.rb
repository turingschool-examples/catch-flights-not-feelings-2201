class Airline < ApplicationRecord
  has_many :flights
  has_many :passenger_flights, through: :flights
  has_many :passengers, through: :passenger_flights

  def list_all_adult_passengers
    self.passengers.where('age >= 18').distinct
  end

  def frequent_flyers
    self.passengers.select("passengers.*, count(flights.id) AS flight_count").group("passengers.id").order("flight_count DESC").where("age >= 18").distinct
  end
end

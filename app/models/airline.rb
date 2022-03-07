class Airline < ApplicationRecord
  has_many :flights
  has_many :passengers, through: :flights

  def adult_passengers
    Airline.joins(flights: :passengers).where('age >= ?', 18)
    .select('passengers.*, COUNT(flights.*) as flight_count')
    .order(flight_count: :desc)
    .group('passengers.id')
    .distinct
  end
end

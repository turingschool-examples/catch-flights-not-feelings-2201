class Airline < ApplicationRecord
  has_many :flights

  def adult_passengers
    Airline.joins(flights: :passengers).distinct.where('age >= ?', 18)
    .select('passengers.*, COUNT(flights.*) as flight_count')
    .group('passengers.id')
    .order(flight_count: :desc)
  
  end
end

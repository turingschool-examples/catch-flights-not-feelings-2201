class Airline < ApplicationRecord
  has_many :flights
  has_many :passenger_flights, through: :flights
  has_many :passengers, through: :passenger_flights

  def adult_passengers_by_frequent
    passengers.joins(:passenger_flights)
              .select("passengers.name, COUNT(passenger_flights.*) AS total_flights")
              .group('passengers.name').where('passengers.age >= 18')
              .order('total_flights DESC')
  end
end

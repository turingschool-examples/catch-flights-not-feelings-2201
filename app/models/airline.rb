class Airline < ApplicationRecord
  has_many :flights
  has_many :passenger_flights, through: :flights
  has_many :passengers, through: :passenger_flights


  def self.get_uniq_passengers(airline)
    Airline.joins(:passengers).
            where('passengers.age > 17', airline: airline).
            select('passengers.*').
            uniq
  end
end
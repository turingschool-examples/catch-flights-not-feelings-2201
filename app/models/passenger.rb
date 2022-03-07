class Passenger < ApplicationRecord
  has_many :flights
  has_many :airlines, through: :flights
  has_many :flight_passengers
  has_many :flights, through: :flight_passengers

  def self.adult
    where('age >= 18').distinct
  end

  def self.frequent_flyers
  end
end

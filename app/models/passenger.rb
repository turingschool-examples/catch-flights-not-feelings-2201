class Passenger < ApplicationRecord
  has_many :flights
  has_many :airlines, through: :flights
  has_many :flight_passengers
  has_many :flights, through: :flight_passengers
end

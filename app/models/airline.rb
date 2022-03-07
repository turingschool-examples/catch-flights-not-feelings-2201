class Airline < ApplicationRecord
  has_many :flights
  has_many :flight_passengers, through: :flights
  has_many :passengers, through: :flight_passengers
  
  def adult_passengers
    passengers
    .where('passengers.age > ?', 17)
    .group(:id)
  end 
end
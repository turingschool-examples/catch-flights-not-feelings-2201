class Airline < ApplicationRecord
  validates_presence_of :name

  has_many :flights
  has_many :passenger_flights, through: :flights
  has_many :passengers, through: :flights


  def uniq_adults
    passengers.where("age > ?", 18)
    .distinct
  end
end

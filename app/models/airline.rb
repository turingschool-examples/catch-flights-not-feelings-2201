class Airline < ApplicationRecord
  has_many :flights
  has_many :passengers, through: :flights

  def adult_passengers
    passengers.distinct.where(age: 18..1000)
  end
end

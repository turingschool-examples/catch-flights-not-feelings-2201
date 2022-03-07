class Airline < ApplicationRecord
  has_many :flights
  has_many :passengers, through: :flights

  def adult_passengers
    passengers.distinct.where("age >= 18").pluck(:name).uniq
  end

  def most_flights
    x = passengers.joins(:flights).count('DISTINCT name')

  end
end

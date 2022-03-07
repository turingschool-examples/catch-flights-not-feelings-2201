class Airline < ApplicationRecord
  validates_presence_of :name

  has_many :flights
  has_many :passenger_flights, through: :flights
  has_many :passengers, through: :passenger_flights


  def uniq_adults
    passengers.joins(:flights)
    .select(:name, :age)
    .where("age > ?", 18)
    .distinct
  end
end

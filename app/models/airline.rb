class Airline < ApplicationRecord
  has_many :flights

  def uniq_adult_passengers
    flights.joins(:passengers)
    .where("age > 18")
    .pluck('passengers.name')
    .uniq
  end
end

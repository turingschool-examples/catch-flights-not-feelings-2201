class Airline < ApplicationRecord
  has_many :flights

  def all_adult_passengers
    flights.joins(:passengers)
    .select('passengers.*')
    .where('passengers.age >= 18')
    .distinct
  end
end

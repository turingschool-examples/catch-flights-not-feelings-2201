class Airline < ApplicationRecord
  has_many :flights

  def unique_adult_passengers
    flights.joins(:passengers)
    .where("age > 17").distinct.pluck(:name)
  end
end

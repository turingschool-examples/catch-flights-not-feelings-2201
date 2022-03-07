class Airline < ApplicationRecord
  has_many :flights

  def passenger_list
    flights.joins(:passengers)
    .group("passengers.id")
    .select("passengers.*, COUNT(passengers.id)")
    .where("passengers.age >= 18")
    .order("count desc")
    .distinct
  end
end
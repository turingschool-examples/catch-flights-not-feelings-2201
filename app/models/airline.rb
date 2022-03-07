class Airline < ApplicationRecord
  has_many :flights

  def passenger_list
    flights.joins(:passengers)
    .select("passengers.*")
    .where("passengers.age >= 18")
    .distinct
  end
end
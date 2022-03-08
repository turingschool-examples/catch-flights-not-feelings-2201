class Airline < ApplicationRecord
  has_many :flights
  has_many :passengers, through: :flights

  def adults
    passengers.select('passengers.*').where('passengers.age >= 18').distinct
  end
end

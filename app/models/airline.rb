class Airline < ApplicationRecord
  has_many :flights
  has_many :passengers, through: :flights

  def list_adult_passengers
    passengers.distinct.where('age > ?', 17).order(:name)
  end
end

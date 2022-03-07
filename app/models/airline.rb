class Airline < ApplicationRecord
  has_many :flights

  has_many :passengers, through: :flights

  def uniq_passengers
    passengers.where('age > 17').distinct
  end
end

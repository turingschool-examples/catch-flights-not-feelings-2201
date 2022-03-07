class Airline < ApplicationRecord
  has_many :flights

  has_many :passengers, through: :flights

  def adults
    passengers.distinct.group(:id).where('age >= ?', 18)
  end
end

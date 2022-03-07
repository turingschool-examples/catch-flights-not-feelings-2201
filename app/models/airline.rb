class Airline < ApplicationRecord
  has_many :flights
  has_many :passengers, through: :flights

  validates_presence_of :name

  def find_distinct_adults
    self.passengers.where('age > 17').distinct
  end
end

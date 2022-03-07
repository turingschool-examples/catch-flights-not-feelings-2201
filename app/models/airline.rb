class Airline < ApplicationRecord
  has_many :flights

  def list_adult_passengers
    binding.pry
  end
end

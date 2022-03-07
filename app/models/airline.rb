class Airline < ApplicationRecord
  has_many :flights

  has_many :passengers, through: :flights

  def adult_passengers
    passengers.select('passengers.*').where('passengers.age >= 18').distinct
  end

  def frequent_flyer
    binding.pry
    adult_passengers    
  end
end

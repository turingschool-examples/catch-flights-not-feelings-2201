class Passenger < ApplicationRecord
  has_many :flight_passengers
  has_many :flights, through: :flight_passengers


  def self.unique_adult_passengers
    where("age > 17").distinct.pluck(:name)
  end
end

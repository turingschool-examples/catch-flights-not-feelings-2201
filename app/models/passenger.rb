class Passenger < ApplicationRecord
  has_many :flight_passengers
  has_many :flights, through: :flight_passengers

  def self.return_adults
    where('age > ?', 17)
  end 
end 
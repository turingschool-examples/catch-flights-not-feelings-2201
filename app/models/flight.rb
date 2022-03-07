class Flight < ApplicationRecord
  belongs_to :airline
  has_many :passenger_flights
  has_many :passengers, through: :passenger_flights

  def adult_passengers
    self.passengers.where('age >= 18').distinct
  end
end 
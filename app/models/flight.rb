class Flight < ApplicationRecord
  belongs_to :airline
  has_many :passenger_flights
  has_many :passengers, through: :passenger_flights

  def add_passenger(passenger)
    passengers << passenger
  end
  def remove_passenger(passenger)
    passengers.delete(passenger)
  end
end
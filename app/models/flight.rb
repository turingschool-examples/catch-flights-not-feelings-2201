class Flight < ApplicationRecord
  belongs_to :airline
  has_many :flight_passengers
  has_many :passengers, through: :flight_passengers

  # def passenger_name
  #   Passenger.find(passenger.id).name
  # end

end

class Flight < ApplicationRecord
  belongs_to :airline
  has_many :passenger_flights
  has_many :passengers, through: :passenger_flights

  def adult_passengers
    adult_passengers = []
    self.passengers.each do |passenger| 
      if passenger.age >= 18
        adult_passengers << passenger
      end 
    end
    adult_passengers
  end
end
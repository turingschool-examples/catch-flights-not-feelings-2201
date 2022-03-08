class Flight < ApplicationRecord
  belongs_to :airline
  has_many :passenger_flights
  has_many :passengers, through: :passenger_flights

    def all_passengers
      self.passengers
    end

    def airline_name
      self.airline.name
    end
end

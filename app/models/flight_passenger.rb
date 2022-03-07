class FlightPassenger < ApplicationRecord
  belongs_to :flight 
  belongs_to :passenger

  def self.find_record(flight_id, passenger_id)
    record = where(flight_id: flight_id, passenger_id: passenger_id)
    record[0]
  end
end
class FlightPassenger < ApplicationRecord
  belongs_to :flight
  belongs_to :passenger

  def self.find_and_delete(flight_id, passenger_id)
    FlightPassenger.destroy(where(flight_id: flight_id, passenger_id: passenger_id)[0].id)
  end
end

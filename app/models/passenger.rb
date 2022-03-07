class Passenger < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true
  validates :flight_id, presence: true

  belongs_to :flight
end

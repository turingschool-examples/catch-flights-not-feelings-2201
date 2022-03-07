class Passenger < ApplicationRecord
  has_many :flight_passengers
  has_many :flights, through: :flight_passengers
  validates :name, presence: true
  validates :age, presence: true
end

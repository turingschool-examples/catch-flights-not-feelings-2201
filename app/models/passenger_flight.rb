class PassengerFlight < ApplicationRecord
  belongs_to :passenger
  belongs_to :flight


    def find_name
      person = Passenger.find(self.passenger_id)
      person.name
    end
end

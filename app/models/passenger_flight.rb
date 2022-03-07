class PassengerFlight < ApplicationRecord
  belongs_to :passenger
  belongs_to :flight


    def find_name
      person = Passenger.find_by(params[:passenger_id])
      person.name
    end
end

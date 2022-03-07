class RenamePassengerFlights < ActiveRecord::Migration[5.2]
  def change
    rename_table :passanger_flights, :passenger_flights
  end
end

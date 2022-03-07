class DropAirlinePaseengersTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :airline_paseengers
  end
end

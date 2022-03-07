class CreateAirlinePaseengers < ActiveRecord::Migration[5.2]
  def change
    create_table :airline_paseengers do |t|
      t.references :airline, foreign_key: true
      t.references :passenger, foreign_key: true

      t.timestamps
    end
  end
end

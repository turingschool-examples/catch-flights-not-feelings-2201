class CreateTablePassengers < ActiveRecord::Migration[5.2]
  def change
    create_table :table_passengers do |t|
      t.string :name
      t.integer :age
    end
  end
end

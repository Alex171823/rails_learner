class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :name
      t.integer :train_id
      t.integer :start_station_id
      t.integer :end_station_id

      t.timestamps
    end
  end
end

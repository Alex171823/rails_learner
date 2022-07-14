class AddIndexToTickets < ActiveRecord::Migration[5.2]
  def change
    add_index :tickets, :start_station_id
    add_index :tickets, :end_station_id
    add_index :tickets, :train_id
  end
end

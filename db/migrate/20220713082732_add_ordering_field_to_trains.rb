class AddOrderingFieldToTrains < ActiveRecord::Migration[5.2]
  def change
    add_column :trains, :ordering, :boolean, :default => 0
  end
end

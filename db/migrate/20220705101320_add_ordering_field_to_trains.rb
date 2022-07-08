class AddOrderingFieldToTrains < ActiveRecord::Migration[7.0]
  def change
    add_column :trains, :ordering, :boolean, :default => 0
  end
end

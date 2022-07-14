class AddIndexToWagons < ActiveRecord::Migration[5.2]
  def change
    add_index :wagons, [:id, :type]
  end
end

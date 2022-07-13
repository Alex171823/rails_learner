class AddIndexToRailwayStationsRoute < ActiveRecord::Migration[5.2]
  def change
    add_column :railway_stations_routes, :index_number, :integer
  end
end

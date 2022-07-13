class AddTimingToRailwayStationRoutes < ActiveRecord::Migration[5.2]
  def change
    add_column :railway_stations_routes, :dispatch_time, :datetime
    add_column :railway_stations_routes, :arrive_time, :datetime
  end
end

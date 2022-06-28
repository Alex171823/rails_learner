class AddCurrentStationIdToTrains < ActiveRecord::Migration[7.0]
  def change
    add_belongs_to :trains, :current_station
  end
end

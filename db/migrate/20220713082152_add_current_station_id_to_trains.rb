class AddCurrentStationIdToTrains < ActiveRecord::Migration[5.2]
  def change
    add_belongs_to :trains, :current_station, index: true
  end
end

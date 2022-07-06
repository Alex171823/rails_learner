class RailwayStationsRoute < ActiveRecord::Base
  belongs_to :railway_station
  belongs_to :route

  validates :railway_station_id, uniqueness: { scope: :route_id }

  def self.find_particular(route, station)
    find_by(route:, railway_station: station)
  end
end

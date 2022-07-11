class Route < ActiveRecord::Base
  validates :name, presence: true
  validate :stations_count

  has_many :railway_stations_routes, dependent: :destroy
  has_many :railway_stations, through: :railway_stations_routes, dependent: :destroy
  has_many :trains, dependent: :nullify

  after_save :set_indexes

  private

  def stations_count
    errors.add(:base, 'Route must contain at least 2 stations') if railway_stations.size < 2
  end

  def set_indexes
    # TODO: DO BULK UPDATE
    index = railway_stations.size.zero? ? railway_stations.size + 1 : 1
    railway_stations.each do |st|
      record = RailwayStationsRoute.find_by(railway_station: st, route: self)
      record.update(index_number: index) if record.index_number.nil?
      index += 1
    end
  end
end

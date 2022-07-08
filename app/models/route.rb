class Route < ActiveRecord::Base
  validates :name, presence: true
  validate :stations_count

  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  private

  def stations_count
    errors.add(:base, 'Route must contain at least 2 stations') if railway_stations.size < 2
  end
end

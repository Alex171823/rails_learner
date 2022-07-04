class RailwayStation < ApplicationRecord
  validates :title, presence: true

  has_many :trains, dependent: :nullify

  has_many :railway_stations_routes, dependent: :destroy
  has_many :routes, through: :railway_stations_routes, dependent: :nullify

  # default_scope { order(:index_number) }
  scope :ordered_by_index, -> { order(index_number: :asc) }

  def update_position(route, index)
    station_route = station_route(route)
    station_route&.update(index_number: index)
  end

  def index_number(route)
    station_route(route).try(:index_number)
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route:).first
  end
end

class RailwayStation < ApplicationRecord
  validates :title, presence: true

  has_many :trains, foreign_key: 'current_station_id', dependent: :destroy

  has_many :railway_stations_routes, dependent: :destroy
  has_many :routes, through: :railway_stations_routes, dependent: :destroy

  # default_scope { order(:index_number) }
  scope :ordered_by_index, -> { order(index_number: :asc) }

  def update_position(route, index)
    # TODO: bulk update
    # get all records for this route
    records = RailwayStationsRoute.where(route: route)
    our_record = records.find_by(railway_station_id: self.id)

    # replace order
    record_to_replace = records.find_by(index_number: index)
    record_to_replace&.update(index_number: our_record.index_number) # update unless nil

    # update index in our record
    our_record.update(index_number: index)

    # make indexes properly ordered
    # record_indexes_to_update = []
    records.order(:index_number).each_with_index do |record, i|
      # record_indexes_to_update << { id: record.id, index_number: i + 1 }
      record.update(index_number: i + 1)
    end
    # record_indexes_to_update = record_indexes_to_update.index_by { |record| record[:id] }
    # RailwayStationsRoute.update(record_indexes_to_update.keys, record_indexes_to_update.values)
  end

  def index_number(route)
    station_route_relation(route).try(:index_number)
  end

  protected

  def station_route_relation(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end

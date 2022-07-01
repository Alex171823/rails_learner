class RailwayStation < ApplicationRecord
  validates :title, presence: true

  has_many :trains

  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  # default_scope { order(:index_number) }
  scope :ordered_by_index, -> { order(index_number: :asc) }
end

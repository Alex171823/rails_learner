class RailwayStation < ApplicationRecord
  validates :title, presence: true

  has_many :trains, dependent: :nullify

  has_many :railway_stations_routes, dependent: :destroy
  has_many :routes, through: :railway_stations_routes, dependent: :nullify

  # default_scope { order(:index_number) }
  scope :ordered_by_index, -> { order(index_number: :asc) }
end

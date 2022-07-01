class Train < ApplicationRecord
  validates :number, presence: true

  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route

  has_many :tickets
  has_many :wagons

  def count_places(wagons_type, places_type)
    wagons.where(type: wagons_type).sum(places_type)
  end
end

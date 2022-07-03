class Wagon < ApplicationRecord
  belongs_to :train, optional: true

  validates :number, :top_seats, :bottom_seats, presence: true

  scope :coupe_wagons, -> { where(type: 'CoupeWagon') }
  scope :economy_wagons, -> { where(type: 'EconomyWagon') }
end

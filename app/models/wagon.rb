class Wagon < ApplicationRecord
  # sets names to be displayed to user for each descendant of Wagon class
  @@wagon_types = { 'Wagon' => 'Abstract Wagon', 'CoupeWagon' => 'Coupe Wagon', 'EconomyWagon' => 'Economy Wagon' }

  belongs_to :train, optional: true

  validates :number, :top_seats, :bottom_seats, presence: true

  scope :coupe_wagons, -> { where(type: 'CoupeWagon') }
  scope :economy_wagons, -> { where(type: 'EconomyWagon') }

  def self.wagon_types
    @@wagon_types
  end
end

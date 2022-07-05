class Wagon < ApplicationRecord
  # sets names to be displayed to user for each descendant of Wagon class
  @@wagon_types = { 'Wagon' => 'Abstract Wagon', 'CoupeWagon' => 'Coupe Wagon', 'EconomyWagon' => 'Economy Wagon' }

  belongs_to :train, optional: true

  validates :number, presence: true
  validates :number, uniqueness: true

  # TODO: validations for each type

  before_validation :set_index_number

  scope :coupe_wagons, -> { where(type: 'CoupeWagon') }
  scope :economy_wagons, -> { where(type: 'EconomyWagon') }

  def self.wagon_types
    @@wagon_types
  end

  private

  def set_index_number
    # TODO: get max index_num from wagons list and +1
    self.index_number = train.wagons.length + 1 unless train.nil?
  end
end

class Wagon < ApplicationRecord
  belongs_to :train, optional: true

  validates :number, presence: true
  validates :number, uniqueness: true

  before_validation :set_index_number

  scope :coupe_wagons, -> { where(type: 'CoupeWagon') }
  scope :economy_wagons, -> { where(type: 'EconomyWagon') }

  private

  def set_index_number
    self.index_number = train.wagons.length + 1 unless train.nil?
  end
end

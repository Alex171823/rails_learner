class Wagon < ApplicationRecord
  belongs_to :train, optional: true

  validates :number, presence: true
  validates :number, uniqueness: true

  # TODO: validations for each type

  before_validation :set_index_number

  scope :coupe_wagons, -> { where(type: 'CoupeWagon') }
  scope :economy_wagons, -> { where(type: 'EconomyWagon') }

  private

  def set_index_number
    # TODO: get max index_num from wagons list and +1
    self.index_number = train.wagons.length + 1 unless train.nil?
  end
end

class Wagon < ApplicationRecord
  # sets names to be displayed to user for each descendant of Wagon class
  WAGON_TYPES = { 'Wagon' => 'Abstract Wagon', 'CoupeWagon' => 'Coupe Wagon', 'EconomyWagon' => 'Economy Wagon',
                  'SittingWagon' => 'Sitting Wagon', 'SleepingWagon' => 'Sleeping Wagon' }.freeze

  belongs_to :train, optional: true

  validates :number, presence: true
  validates :number, uniqueness: true

  after_create :set_indexes

  scope :coupe_wagons, -> { where(type: 'CoupeWagon') }
  scope :economy_wagons, -> { where(type: 'EconomyWagon') }

  def self.wagon_types
    WAGON_TYPES
  end

  def self.wagon_types_for_selection
    WAGON_TYPES
  end

  private

  def set_indexes
    # TODO: DO BULK UPDATE
    index = train.wagons.size.zero? ? train.wagons.wagons.size + 1 : 1
    train.wagons.each do |wagon|
      wagon.update(index_number: index) if wagon.index_number.nil?
      index += 1
    end
  end
end

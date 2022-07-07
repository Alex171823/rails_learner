class Wagon < ApplicationRecord
  # sets names to be displayed to user for each descendant of Wagon class
  @@wagon_types = { 'Wagon' => 'Abstract Wagon', 'CoupeWagon' => 'Coupe Wagon', 'EconomyWagon' => 'Economy Wagon',
                    'SittingWagon' => 'Sitting Wagon', 'SleepingWagon' => 'Sleeping Wagon' }
  @@allowed_fields = %w[id number type train_id index_number]

  belongs_to :train, optional: true

  validates :number, presence: true
  validates :number, uniqueness: true

  before_validation :put_to_tail
  before_validation :check_fields

  scope :coupe_wagons, -> { where(type: 'CoupeWagon') }
  scope :economy_wagons, -> { where(type: 'EconomyWagon') }

  def self.wagon_types
    @@wagon_types
  end

  private

  def put_to_tail
    last_train = train.wagons.order(:index_number).last
    self.index_number = (last_train.nil? ? 1 : last_train.index_number + 1)
  end

  # checks if this field can be present in model
  def check_fields
    self.class.column_names.each do |column|
      next unless !@@allowed_fields.include?(column) && !send(column.to_sym).nil?

      # TODO: remove print
      p "ERROR #{column}"
      errors.add(column.to_sym, 'Not allowed for this model')
    end
  end
end

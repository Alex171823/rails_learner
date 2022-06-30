class Wagon < ApplicationRecord
  belongs_to :train, optional: true

  validates :number, :top_seats, :bottom_seats, presence: true
end

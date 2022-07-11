class SittingWagon < Wagon
  validates :top_seats, absence: true
  validates :bottom_seats, absence: true
  validates :side_top_seats, absence: true
  validates :side_bottom_seats, absence: true

  validates :sitting_seats, presence: true
  validates_numericality_of :sitting_seats, greater_than_or_equal_to: 0
end

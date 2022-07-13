class CoupeWagon < Wagon
  validates :top_seats, :bottom_seats, presence: true
  validates_numericality_of :top_seats, :bottom_seats, greater_than_or_equal_to: 0

  validates :side_top_seats, absence: true
  validates :side_bottom_seats, absence: true
  validates :sitting_seats, absence: true
end

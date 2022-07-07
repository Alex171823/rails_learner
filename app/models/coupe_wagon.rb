class CoupeWagon < Wagon
  @@allowed_fields += %w[top_seats bottom_seats]

  validates :top_seats, :bottom_seats, presence: true
  validates_numericality_of :top_seats, :bottom_seats, greater_than_or_equal_to: 0
end

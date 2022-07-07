class SittingWagon < Wagon
  @@allowed_fields += %w[sitting_seats]

  validates :sitting_seats, presence: true
  validates_numericality_of :sitting_seats, greater_than_or_equal_to: 0
end

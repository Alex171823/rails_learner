class EconomyWagon < Wagon
  @@allowed_fields += %w[top_seats bottom_seats side_top_seats side_bottom_seats]

  validates :side_bottom_seats, :side_top_seats, presence: true
  validates_numericality_of :side_bottom_seats, :side_top_seats, greater_than_or_equal_to: 0
end

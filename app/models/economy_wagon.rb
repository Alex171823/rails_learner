class EconomyWagon < Wagon
  validates :side_bottom_seats, :side_top_seats, presence: true
end

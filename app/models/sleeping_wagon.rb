class SleepingWagon < Wagon
  validates :bottom_seats, presence: true
  validates_numericality_of :bottom_seats, greater_than_or_equal_to: 0
end

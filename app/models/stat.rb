class Stat < ApplicationRecord
  belongs_to :player
  validates :position_rank, presence: true
  validates :fantasy_points, presence: true
end

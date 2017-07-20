class Player < ApplicationRecord
  belongs_to :team
  has_many :stats
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :position, presence: true
  validates :nfl_team, presence: true
end

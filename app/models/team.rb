class Team < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :players

  def self.owned_team_players
    find_by(owned: true).players.order(:position)
  end

  def self.comp_team_players(id)
    where(owned: false).find(id).players.order(:position)
  end
end

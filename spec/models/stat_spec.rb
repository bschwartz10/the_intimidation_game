require 'rails_helper'

RSpec.describe Stat, type: :model do
  describe "validations" do
    it "is valid with all valid attributes" do
      team = Team.create(name: "Brett's Team")
      player = team.players.create(first_name: "Brett", last_name: "Schwartz", position: 0, nfl_team:"Jets")
      stat = player.stats.create(pass_yards: 1000, pass_tds: 10, interceptions: 10, position_rank: 1, fantasy_points: 700)
      expect(stat).to be_valid
    end
    it "is invalid without overall rank" do
      team = Team.create(name: "Brett's Team")
      player = team.players.create(first_name: "Brett", last_name: "Schwartz", position: 0, nfl_team:"Jets")
      stat = player.stats.create(pass_yards: 1000, pass_tds: 10, interceptions: 10, fantasy_points: 700)

      expect(stat).to_not be_valid
    end
    it "defaults fantasy_points to 0" do
      team = Team.create(name: "Brett's Team")
      player = team.players.create(first_name: "Brett", last_name: "Schwartz", position: 0, nfl_team:"Jets")
      stat = player.stats.create(pass_yards: 1000, pass_tds: 10, interceptions: 10, position_rank: 1)

      expect(stat.fantasy_points).to eq(0)
    end
  end
end

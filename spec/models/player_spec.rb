require 'rails_helper'

RSpec.describe Player, type: :model do
  describe "validations" do
    it "is valid with all valid attributes" do
      team = Team.create(name: "Brett's Team")
      player = team.players.create(first_name: "Brett", last_name: "Schwartz", position: "QB", nfl_team:"Jets")

      expect(player).to be_valid
    end
    it "is invalid without a first name" do
      team = Team.create(name: "Brett's Team")
      player = team.players.create(last_name: "Schwartz", position: "QB", nfl_team:"Jets")

      expect(player).to_not be_valid
    end
    it "is invalid without a last name" do
      team = Team.create(name: "Brett's Team")
      player = team.players.create(first_name: "Brett", position: "QB", nfl_team:"Jets")

      expect(player).to_not be_valid
    end
    it "is invalid without a position" do
      team = Team.create(name: "Brett's Team")
      player = team.players.create(first_name: "Brett", last_name: "Schwartz", nfl_team:"Jets")

      expect(player).to_not be_valid
    end
    it "is invalid without a nfl team" do
      team = Team.create(name: "Brett's Team")
      player = team.players.create(first_name: "Brett", last_name: "Schwartz", position: "QB")

      expect(player).to_not be_valid
    end
    it "is invalid without a team" do
      player = Player.create(first_name: "Brett", last_name: "Schwartz", position: "QB", nfl_team: "Jets")

      expect(player).to_not be_valid
    end
  end
  describe "relationships" do
    it "belongs to a team" do
      team = Team.create(name: "Brett's Team")
      player = team.players.create(first_name: "Brett", last_name: "Schwartz", position: "QB", nfl_team:"Jets")

      expect(player).to respond_to(:team)
    end
  end
end

require 'rails_helper'

  RSpec.describe Team, type: :model do
    describe "validations" do
      it "is valid with valid attributes" do
        team = Team.create(name: "Brett's Team", owned: true)

          expect(team.name).to eq("Brett's Team")
          expect(team.owned).to eq(true)
          expect(team).to be_valid
      end
      it "is invalid without a name" do
          team = Team.create(name: "")

          expect(team).to_not be_valid
      end
      it "is invalid with duplicate names" do
          Team.create(name: "Brett's Team")
          team2= Team.create(name: "Brett's Team")

          expect(team2).to_not be_valid
      end

    describe "relationships" do
      it "has many players" do
        team = Team.create(name: "Brett's Team")

        expect(team).to respond_to(:players)
      end
    end
  end
end

require 'rails_helper'

describe 'Team computer API' do
  it 'sends data for all teams that have a status of not owned' do
    Team.create(name: "Computer Team 1", owned: false)
    Team.create(name: "Computer Team 2", owned: false)

    get "/api/v1/teams/comp_team"

    teams = JSON.parse(response.body)
    expect(response).to be_success
    expect(teams).to be_an(Array)
    expect(teams.count).to eq(2)
    expect(teams.first["name"]).to eq("Computer Team 1")
    expect(teams.second["name"]).to eq("Computer Team 2")
  end
  it "sends data for one team that has a status of not owned" do
    team = Team.create(name: "Computer Team 1", owned: false)

    get "/api/v1/teams/comp_team/#{team.id}"

    team = JSON.parse(response.body)
    expect(response).to be_success
    expect(team).to be_an(Object)
    expect(team["name"]).to eq("Computer Team 1")
  end
end

require 'rails_helper'

describe 'Team owned player API' do
  it 'sends the players data for a team that has a status of owned' do
    team = Team.create(name: "Bretts Team", owned: true)
    team.players.create(first_name: "Aaron", last_name: "Rodgers", position: "QB", nfl_team: "GNB", team_id: 1)
    team.players.create(first_name: "David", last_name: "Johnson", position: "RB", nfl_team: "ARI", team_id: 1)
    team.players.create(first_name: "Ezekiel", last_name: "Elliott", position: "RB", nfl_team: "DAL", team_id: 1)
    team.players.create(first_name: "Mike", last_name: "Evans", position: "WR", nfl_team: "TAM", team_id: 1)
    team.players.create(first_name: "Jordy", last_name: "Nelson", position: "WR", nfl_team: "GNB", team_id: 1)
    team.players.create(first_name: "Antonio", last_name: "Brown", position: "WR", nfl_team: "PIT", team_id: 1)
    team.players.create(first_name: "Travis", last_name: "Kelce", position: "TE", nfl_team: "KAN", team_id: 1)

    get "/api/v1/teams/owned_team_players"

    players = JSON.parse(response.body)

    expect(response).to be_success
    expect(players).to be_an(Array)
    expect(players.count).to eq(7)
    expect(players.first["first_name"]).to eq("Aaron")
  end
end

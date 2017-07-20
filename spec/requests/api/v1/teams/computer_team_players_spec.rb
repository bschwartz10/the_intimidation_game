require 'rails_helper'

describe 'Team computer player API' do
  it 'sends the players data for a team that has a status of not owned' do
    team1 = Team.create(name: "Computer Team 1", owned: false)
    team1.players.create(first_name: "Aaron", last_name: "Rodgers", position: "QB", nfl_team: "GNB", team_id: team1.id)
    team1.players.create(first_name: "David", last_name: "Johnson", position: "RB", nfl_team: "ARI", team_id: team1.id)
    team1.players.create(first_name: "Leveon", last_name: "Bell", position: "RB", nfl_team: "PIT", team_id: team1.id)
    team1.players.create(first_name: "Mike", last_name: "Evans", position: "WR", nfl_team: "TAM", team_id: team1.id)
    team1.players.create(first_name: "Jordy", last_name: "Nelson", position: "WR", nfl_team: "GNB", team_id: team1.id)
    team1.players.create(first_name: "Antonio", last_name: "Brown", position: "WR", nfl_team: "PIT", team_id: team1.id)
    team1.players.create(first_name: "Travis", last_name: "Kelce", position: "TE", nfl_team: "KAN", team_id: team1.id)

    get "/api/v1/teams/comp_team_players/#{team1.id}"

    players = JSON.parse(response.body)
    expect(response).to be_success
    expect(players).to be_an(Array)
    expect(players.count).to eq(7)
    expect(players.first["first_name"]).to eq("Aaron")
  end
end

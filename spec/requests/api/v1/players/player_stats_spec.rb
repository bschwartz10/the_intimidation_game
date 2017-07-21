require 'rails_helper'

describe 'Player stats API' do
  it 'sends the stats data for one player' do
    team = Team.create(name: "Computer Team 1", owned: false)
    player = team.players.create(first_name: "Aaron", last_name: "Rodgers", position: "QB", nfl_team: "GNB", team_id: team.id)
    player.stats.create(pass_yards: 1000, pass_tds: 10, interceptions: 10, position_rank: 1, fantasy_points: 700)

    get "/api/v1/players/player_stats/#{player.id}"

    stats = JSON.parse(response.body)
    expect(response).to be_success
    expect(stats).to be_an(Array)
    expect(stats.count).to eq(1)
    expect(stats.first["pass_yards"]).to eq(1000)
  end
end

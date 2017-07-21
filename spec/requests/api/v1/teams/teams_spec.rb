require 'rails_helper'

describe 'Teams API' do
  it 'sends nested data for every team with each player and associated stats for that player' do
    team1 = Team.create(name: "Brett's Team", owned: true)
    team2 = Team.create(name: "Chestyr's Team", owned: false)

    player1 = team1.players.create(first_name: "Aaron", last_name: "Rodgers", position: "QB", nfl_team: "GNB", team_id: team1.id)
    player2 = team2.players.create(first_name: "Tom", last_name: "Brady", position: "QB", nfl_team: "NE", team_id: team2.id)
    player3 = team1.players.create(first_name: "David", last_name: "Johnson", position: "RB", nfl_team: "ARI", team_id: team1.id)
    player4 = team1.players.create(first_name: "Leveon", last_name: "Bell", position: "RB", nfl_team: "PIT", team_id: team1.id)
    player5 = team2.players.create(first_name: "Larry", last_name: "Johnson", position: "RB", nfl_team: "KC", team_id: team2.id)
    player6 = team2.players.create(first_name: "Saquan", last_name: "Barkley", position: "RB", nfl_team: "NYJ", team_id: team2.id)
    player7 = team1.players.create(first_name: "Mike", last_name: "Evans", position: "WR", nfl_team: "TAM", team_id: team1.id)
    player8 = team1.players.create(first_name: "Jordy", last_name: "Nelson", position: "WR", nfl_team: "GNB", team_id: team1.id)
    player9 = team1.players.create(first_name: "Antonio", last_name: "Brown", position: "WR", nfl_team: "PIT", team_id: team1.id)
    player10 = team2.players.create(first_name: "Eric", last_name: "Decker", position: "WR", nfl_team: "TEN", team_id: team2.id)
    player11 = team2.players.create(first_name: "Brandon", last_name: "Marshall", position: "WR", nfl_team: "NYG", team_id: team2.id)
    player12 = team2.players.create(first_name: "Brandin", last_name: "Cooks", position: "WR", nfl_team: "NE", team_id: team2.id)
    player13 = team1.players.create(first_name: "Travis", last_name: "Kelce", position: "TE", nfl_team: "KAN", team_id: team1.id)
    player14 = team2.players.create(first_name: "Rob", last_name: "Gronkowski", position: "TE", nfl_team: "NE", team_id: team2.id)

    player1.stats.create(pass_yards: 1000, pass_tds: 10, interceptions: 10, position_rank: 1, fantasy_points: 700)
    player2.stats.create(pass_yards: 1000, pass_tds: 10, interceptions: 10, position_rank: 2, fantasy_points: 700)
    player3.stats.create(rush_yards: 1000, rush_tds: 10, receptions: 50, position_rank: 1, fantasy_points: 700)
    player4.stats.create(rush_yards: 1000, rush_tds: 10, receptions: 50, position_rank: 2, fantasy_points: 700)
    player5.stats.create(rush_yards: 1000, rush_tds: 10, receptions: 50, position_rank: 3, fantasy_points: 700)
    player6.stats.create(rush_yards: 1000, rush_tds: 10, receptions: 50, position_rank: 4, fantasy_points: 700)
    player7.stats.create(rec_yards: 1000, rec_tds: 10, receptions: 100, position_rank: 1, fantasy_points: 700)
    player8.stats.create(rec_yards: 1000, rec_tds: 10, receptions: 100, position_rank: 2, fantasy_points: 700)
    player9.stats.create(rec_yards: 1000, rec_tds: 10, receptions: 100, position_rank: 3, fantasy_points: 700)
    player10.stats.create(rec_yards: 1000, rec_tds: 10, receptions: 100, position_rank: 4, fantasy_points: 700)
    player11.stats.create(rec_yards: 1000, rec_tds: 10, receptions: 100, position_rank: 5, fantasy_points: 700)
    player12.stats.create(rec_yards: 1000, rec_tds: 10, receptions: 100, position_rank: 6, fantasy_points: 700)
    player13.stats.create(rec_yards: 1000, rec_tds: 10, receptions: 100, position_rank: 1, fantasy_points: 700)
    player14.stats.create(rec_yards: 1000, rec_tds: 10, receptions: 100, position_rank: 2, fantasy_points: 700)

    get "/api/v1/teams/teams"

    teams = JSON.parse(response.body)
    expect(response).to be_success
    expect(teams).to be_an(Array)
    expect(teams[0]).to be_an(Hash)
    expect(teams[0]["name"]).to eq("Brett's Team")
    expect(teams[1]["name"]).to eq("Chestyr's Team")
    expect(teams[0]["players"]).to be_an(Array)
    expect(teams[0]["players"][0]["first_name"]).to eq("Aaron")
    expect(teams[0]["players"][0]["stats"]).to be_an(Array)
    expect(teams[0]["players"][0]["stats"][0]["pass_yards"]).to eq(1000)
    expect(teams[1]["players"]).to be_an(Array)
    expect(teams[1]["players"][0]["first_name"]).to eq("Tom")
    expect(teams[1]["players"][0]["stats"]).to be_an(Array)
    expect(teams[1]["players"][0]["stats"][0]["pass_yards"]).to eq(1000)
  end

  it "sends the data for one team" do
    team1 = Team.create(name: "Brett's Team", owned: true)

    player1 = team1.players.create(first_name: "Aaron", last_name: "Rodgers", position: "QB", nfl_team: "GNB", team_id: team1.id)
    player2 = team1.players.create(first_name: "David", last_name: "Johnson", position: "RB", nfl_team: "ARI", team_id: team1.id)
    player3 = team1.players.create(first_name: "Leveon", last_name: "Bell", position: "RB", nfl_team: "PIT", team_id: team1.id)
    player4 = team1.players.create(first_name: "Mike", last_name: "Evans", position: "WR", nfl_team: "TAM", team_id: team1.id)
    player5 = team1.players.create(first_name: "Jordy", last_name: "Nelson", position: "WR", nfl_team: "GNB", team_id: team1.id)
    player6 = team1.players.create(first_name: "Antonio", last_name: "Brown", position: "WR", nfl_team: "PIT", team_id: team1.id)
    player7 = team1.players.create(first_name: "Travis", last_name: "Kelce", position: "TE", nfl_team: "KAN", team_id: team1.id)

    player1.stats.create(pass_yards: 1000, pass_tds: 10, interceptions: 10, position_rank: 1, fantasy_points: 700)
    player2.stats.create(rush_yards: 1000, rush_tds: 10, receptions: 50, position_rank: 1, fantasy_points: 700)
    player3.stats.create(rush_yards: 1000, rush_tds: 10, receptions: 50, position_rank: 2, fantasy_points: 700)
    player4.stats.create(rec_yards: 1000, rec_tds: 10, receptions: 100, position_rank: 1, fantasy_points: 700)
    player5.stats.create(rec_yards: 1000, rec_tds: 10, receptions: 100, position_rank: 2, fantasy_points: 700)
    player6.stats.create(rec_yards: 1000, rec_tds: 10, receptions: 100, position_rank: 3, fantasy_points: 700)
    player7.stats.create(rec_yards: 1000, rec_tds: 10, receptions: 100, position_rank: 1, fantasy_points: 700)

    get "/api/v1/teams/teams/#{team1.id}"

    team = JSON.parse(response.body)
    expect(response).to be_success
    expect(team).to be_an(Hash)
    expect(team["name"]).to eq("Brett's Team")
    expect(team["players"][0]["stats"]).to be_an(Array)
    expect(team["players"][0]["stats"][0]["pass_yards"]).to eq(1000)
  end
end

require 'csv'
require 'database_cleaner'

DatabaseCleaner.clean_with(:truncation)

team_names = ['Golden Tate Warriors',
              'Little Red Fournette',
              'Hide & Zeke',
              'Dalvin & The Chipmunks',
              'When the LeVeon Breaks',
              'Game of Jones',
              "Le'Veon la Vida Loca",
              'Drinkin Fortes',
              'Forte Shades of Grey',
              'Julio Let the Dogs Out',
              'Goff Balls']

Team.create(name: "Bretts Team", owned: true)

11.times do |i|
  Team.create(name: team_names[i])
end

CSV.foreach "db/csv/stats.csv", headers: true, header_converters: :symbol do |row|
  player = Player.new(
    first_name: row[:name].split(' ')[0],
    last_name: row[:name].split('\\')[0].split(' ')[1],
    nfl_team: row[:tm],
    position: row[:fantpos],
  )
  player.save(validate: false)

  player.stats.create!(
    pass_yards: row[:passyds],
    pass_tds: row[:passtd],
    interceptions: row[:int],
    rush_yards: row[:rushyds],
    rush_tds: row[:rushtd],
    receptions: row[:receptions],
    rec_yards: row[:recyds],
    rec_tds: row[:rectd],
    fantasy_points: row[:fantpt] || 0,
    position_rank: row[:posrank]
  )
  puts "#{player.first_name} #{player.last_name} was created with his stats."
end

teams = Team.all

Player.where(position: "qb").take(12).order(:random).each do |player|
  team << player
end

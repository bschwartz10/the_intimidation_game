class StatSerializer < ActiveModel::Serializer
  attributes :id,
             :pass_yards,
             :pass_tds,
             :interceptions,
             :rush_yards,
             :rush_tds,
             :rec_yards,
             :rec_tds,
             :receptions,
             :position_rank,
             :fantasy_points,
             :player_id

end

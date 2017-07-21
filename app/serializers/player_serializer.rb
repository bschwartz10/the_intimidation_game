class PlayerSerializer < ActiveModel::Serializer
  attributes :id,
             :first_name,
             :last_name,
             :position,
             :nfl_team,
             :team_id,
             :stats

end

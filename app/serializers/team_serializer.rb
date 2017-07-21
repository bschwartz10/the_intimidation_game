class TeamSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :owned,
             :players

  has_many :players
end

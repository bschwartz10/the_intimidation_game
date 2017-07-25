class TeamSerializer < ActiveModel::Serializer
  attributes :name,
             :players

  has_many :players
end

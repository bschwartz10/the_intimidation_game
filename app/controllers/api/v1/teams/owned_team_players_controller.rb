class::Api::V1::Teams::OwnedTeamPlayersController < ApplicationController

  def index
    render json: Team.owned_team_players
  end

end

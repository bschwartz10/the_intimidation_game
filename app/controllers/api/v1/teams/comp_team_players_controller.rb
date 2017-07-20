class::Api::V1::Teams::CompTeamPlayersController < ApplicationController
  def show
    render json: Team.comp_team_players(params[:id])
  end
end

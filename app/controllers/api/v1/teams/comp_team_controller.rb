class::Api::V1::Teams::CompTeamController < ApplicationController

  def index
    render json: Team.where(owned: false)
  end

  def show
    render json: Team.where(owned: false).find(params[:id])
  end
end

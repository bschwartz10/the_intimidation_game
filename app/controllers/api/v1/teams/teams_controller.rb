class::Api::V1::Teams::TeamsController < ApplicationController

  def index
    render json: Team.all
  end

  def show
    render json: Team.find(params[:id])
  end
end

class::Api::V1::Players::StatsController < ApplicationController

  def index
    render json: Player.all
  end
  
  def show
    render json: Player.find(params[:id]).stats
  end

end

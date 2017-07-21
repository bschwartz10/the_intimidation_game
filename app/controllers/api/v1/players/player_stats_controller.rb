class::Api::V1::Players::PlayerStatsController < ApplicationController

  def show
    render json: Player.find(params[:id]).stats
  end

end

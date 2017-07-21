class::Api::V1::Players::StatsController < ApplicationController

  def show
    render json: Player.find(params[:id]).stats
  end

end

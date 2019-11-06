class Api::V1::OlympianStatsController < ApplicationController

  def index
    render json: { olympian_stats: OlympianStatsSerializer.new(OlympianStatistics.new) }

  end

end

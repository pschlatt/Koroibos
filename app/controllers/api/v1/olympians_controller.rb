class Api::V1::OlympiansController < ApplicationController

  def index
    render json: { olympians: OlympianSerializer.new(Olympian.all) }
  end

  def show
    if age_params[:age] == "youngest"
      render json: OlympianSerializer.new(Olympian.youngest)
    elsif age_params[:age] == "oldest"
      render json: OlympianSerializer.new(Olympian.oldest)
    end
  end

  private

  def age_params
    params.permit(:age)
  end

end

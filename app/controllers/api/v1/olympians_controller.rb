class Api::V1::OlympiansController < ApplicationController

  def index
    render json: { olympians: OlympianSerializer.new(Olympian.all) }
  end

end

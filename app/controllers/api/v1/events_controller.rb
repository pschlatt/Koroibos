class Api::V1::EventsController < ApplicationController

  def index
    render json: EventSerializer.new(EventFacade.new)
  end

  def show
    render json: EventMedalistSerializer.new(EventMedalistFacade.new(params[:id]))
  end

end

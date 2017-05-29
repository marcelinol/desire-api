class DesiresController < ApplicationController
  def index
    desires = Desire.all
    json_response(desires)
  end

  def create
    desire = Desire.create!(desire_params)
    json_response(desire, :created)
  end

  private
  def desire_params
    params.fetch(:desire, {}).permit(:name)
  end
end

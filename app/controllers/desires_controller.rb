class DesiresController < ApplicationController
  def index
    @desires = Desire.all
    render json: @desires, status: :ok
  end
end

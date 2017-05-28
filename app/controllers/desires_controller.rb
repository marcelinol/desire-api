class DesiresController < ApplicationController
  def index
    @desires = Desire.all
    render json: @desires, status: :ok
  end

  def create
    desire = Desire.new(desire_params)

    if desire.save
      render :nothing, status: :created
    end
  end

  private
  def desire_params
    params.require(:desire).permit(:name)
  end
end

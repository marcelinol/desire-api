class DesiresController < ApplicationController
  def index
    @desires = Desire.all
    render json: @desires, status: :ok
  end

  def create
    desire = Desire.new(desire_params)

    if desire.save
      render :nothing, status: :created
    else
      render plain: desire.errors.full_messages.first, status: :unprocessable_entity
    end
  end

  private
  def desire_params
    params.fetch(:desire, {}).permit(:name)
  end
end

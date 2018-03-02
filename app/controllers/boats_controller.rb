class BoatsController < ApplicationController
  def index
    @boats = Boat.all
    @current_user = current_user.id
  end

  def new
    @current_user = current_user.id
  end

  def create
    @current_user = current_user.id
    @boat = Boat.create(boat_params)
  end

  def show
    @current_user = current_user.id
    @boat = Boat.find(params[:id])
    @user = User.find(params[:user_id])
    @jobs = Job.all
  end

  def edit
    @current_user = current_user.id
  end

  def update
    @current_user = current_user.id
  end

  def destroy

  end

  private

  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.

  def boat_params
    params.require(:boat).permit(:avatar, :name, :capacity, :location, :loadtaken, :user_id)
  end
end

class BoatsController < ApplicationController
  def create
    @boat = Boat.create(boat_params)
  end
  def show
    @boat = Boat.find(params[:id])
    @user = User.find(params[:user_id])
  end
  private

  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.

  def boat_params
    params.require(:user).permit(:avatar)
  end
end

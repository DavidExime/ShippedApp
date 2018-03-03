class BoatsController < ApplicationController
  def index
    @boats = Boat.all
    @current_user = current_user.id
  end

  def new
    @current_user = current_user.id
    @default_load = 0;
    @boat = Boat.new
  end

  def create
    @current_user = current_user.id
    @boat = Boat.create(boat_params)
    @boat_id = Boat.last.id
    if @boat.save
      flash[:message] = 'Boat Created'
      redirect_to "/users/#{@current_user}/boats/#{@boat_id}"
    else
      flash[:message] = 'Capacity Must Be A Number Greater Than Zero'
      redirect_back(fallback_location: "/users/#{@current_user}/boats/new")
    end
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

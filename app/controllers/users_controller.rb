class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.find_by_email(params[:id])
    @current_user = current_user.id
  end

  def new
    @current_user = current_user.id
  end

  def create
    @current_user = current_user.id
  end

  def show
    
    @current_user = current_user.id
    @user = User.find(params[:id])
    @boats = Boat.all

  end

  def edit
    @current_user = current_user.id
    redirect_to '/users/edit'
  end

  def update
    @current_user = current_user.id
  end

  def destroy

  end
end

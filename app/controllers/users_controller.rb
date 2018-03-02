class UsersController < ApplicationController
  def index
    @boats = Boat.all
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

class UsersController < ApplicationController
  def index
    @boats = Boat.all
  end
end

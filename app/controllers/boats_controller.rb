class BoatsController < ApplicationController
  def index
    @boats = Boat.all
    # @user = User.find(params[:user_id])
    # @current_user = current_user.id
  end

  def new
    @current_user = current_user.id
    @default_load = 0;
    @boat = Boat.new
  end

  def create

    @boat = Boat.create(boat_params)
    @boat.user_id = current_user.id
    # @boat_id = Boat.last.id
    if @boat.save
      flash[:message] = 'Boat Created'
      redirect_to user_boat_path(:id => @boat.id, :user_id => @boat.user_id)
    else
      flash[:message] = 'Capacity Must Be A Number Greater Than Zero'
      redirect_back(fallback_location: "/users/#{@current_user}/boats/new")
    end
  end

  def show
    @current_user = current_user.id
    @boat = Boat.find(params[:id])
    @user = User.find(params[:user_id])
    @boatjobs = Work.where(boat_id: params[:id])
    @jobs = Job.where.not(recontainers: 0)
    @boat_cap = @boat.capacity - @boat.loadtaken
  end

  def edit
    @current_user = current_user.id
    @boat = Boat.find(params[:id])
    @work = Work.where(boat_id: params[:id])
  end

  def update
    @current_user = current_user.id
    @boat = Boat.find(params[:id])
    if @boat.update(boat_params)
      flash[:message] = "Boat updated"
      redirect_to user_boat_path
    else
      flash[:message] = "Update Unsuccessful"
      render user_boat_path
    end
  end

  def destroy
    @boat = Boat.find(params[:id])
    @boat.destroy
    redirect_to user_path(:id => current_user.id)
  end

  def removejob
    boat = Boat.find(params[:id])
    work = Work.where(job_id: params[:jobid], boat_id: params[:id])[0]
    job = Job.find(params[:jobid])
    containers = work.containers
    if boat.jobs.delete(params[:jobid])
      flash[:message] = "Job removed"
      boat.decrement!('loadtaken', containers)
      job.increment!('recontainers', containers)
      redirect_to user_boat_path
    else
      flash[:message] = "Update Unsuccessful"
      render user_boat_path
    end
  end
  private

  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.

  def boat_params
    params.require(:boat).permit(:avatar, :name, :capacity, :location, :loadtaken, :user_id)
  end
end

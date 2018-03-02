class JobsController < ApplicationController

  def index
	@job = Job.new
  @current_user = current_user.id
  end

  def new
    @current_user = current_user.id
  	@job = Job.new
  end

  def create
    @current_user = current_user.id
  end

  def show
    @current_user = current_user.id
  end

  def edit
    @current_user = current_user.id
  end

  def update
    @current_user = current_user.id
  end

  def destroy
    @current_user = current_user.id
  end
  def assignjob
    @boat = Boat.find(params[:id])
    @job = Job.find(params[:jobid])
    @boat.jobs << @job
    redirect_to user_boat_path(id: params[:id], user_id: current_user.id)
  end
  private

  def job_params
    params.require(:job).permit(:description, :origin, :destination, :cost, :totalcontainers, :recontainers)
  end
end

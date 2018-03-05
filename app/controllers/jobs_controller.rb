class JobsController < ApplicationController

  def index

	@jobs = Job.all

	@job = Job.new
  @current_user = current_user.id

  end

  def new
    @current_user = current_user.id
  	@job = Job.new
  end

  def create

  	@job = Job.new(job_params)
  	@job.recontainers = @job.totalcontainers  
  	@job.cost = @job.totalcontainers * 100  
  	if @job.save
  		redirect_to "/jobs"
  	else
  		redirect_to new_job_path
  	end
  end


  private

  def job_params
  	params.require(:job).permit(:description, :origin, :destination, :cost, :totalcontainers,
  		:recontainers)

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

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

  def show
    @current_user = current_user.id
    @job = Job.find_by_id(params[:id])

  end

  def edit
    @job = Job.find_by_id(params[:id])

    # @current_user = current_user.id
  end

  def update
    @job = Job.find_by_id(params[:id])
    current_one = @job.totalcontainers
    @job.cost = current_one
    # @current_user = current_user.id
    if @job.update(job_params)
      flash[:message] = "Job updated"
      redirect_to jobs_path
    else
      flash[:message] = "Update Unsuccessful"
      render edit_job_path
    end
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

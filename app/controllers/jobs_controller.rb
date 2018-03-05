class JobsController < ApplicationController
  
  def index
	@jobs = Job.all
  end

  def new
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
  end
end

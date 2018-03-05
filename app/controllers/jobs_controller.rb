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
  	# if(@job.cost.to_f < 100)
   #        flash[:message] = 'All Jobs Must Cost Min $100'
   #          redirect_to jobs_path     
   #  end
   #  if(@job.description.length < 20)
   #        flash[:message] = 'Descriptions must be longer than 20 characters'
   #          redirect_to jobs_path 
   #  end

  	if @job.save
  		flash[:message] = 'Job saved'
  		redirect_to jobs_path

  	else      
  		render "/jobs/new"
  		flash[:message] = 'Job unsaved'
  	end
  end


  private


  def job_params
  	params.require(:job).permit(:description, :origin, :destination, :cost, :totalcontainers,
  		:recontainers)
  end
end

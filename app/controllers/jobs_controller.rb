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

  def show
    @current_user = current_user.id
    @jobs = Job.all
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
    boat = Boat.find(params[:id])
    job = Job.find(params[:jobid])
    params[:containers] = params[:containers].to_i
    boat.jobs << job
    work = Work.where(job_id: params[:jobid], boat_id: params[:id])
    work.update(containers: params[:containers])
    boat.increment!('loadtaken', params[:containers])
    job.increment!('recontainers', -params[:containers])
    redirect_to user_boat_path(id: params[:id], user_id: current_user.id)
  end
  private


  def job_params
    params.require(:job).permit(:description, :origin, :destination, :cost, :totalcontainers, :recontainers)

  end
end

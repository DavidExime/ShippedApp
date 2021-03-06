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
  		flash[:message] = 'Description has to be at least 20 characters, amount of containers has to be at least 1'
  	end
  end

  def show
    @current_user = current_user.id
    @job = Job.find_by_id(params[:id])
    @works = Work.where(job_id: params[:id])
  end

  def edit
    @job = Job.find_by_id(params[:id])


  end

  def update
    @job = Job.find_by_id(params[:id])
    current_one = @job.totalcontainers
    @job.cost = current_one

    if @job.update(job_params)
      flash[:message] = "Job updated"
      redirect_to job_path
      @job.increment!('recontainers', params[:totalcontainers].to_i)
    else
      flash[:message] = "Update Unsuccessful"
      redirect_back(fallback_location: "/jobs")
    end
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

  def unassign_boat
    job = Job.find_by_id(params[:id])
    work = Work.where(job_id: params[:id])[0]
    boat = Boat.find_by_id(params[:boatid])
    containers = work.containers
    if job.boats.delete(params[:boatid])
      boat.decrement!('loadtaken', containers)
      job.increment!('recontainers', containers)
      redirect_back(fallback_location: "/boats")
    else
      render job_path
    end
  end

  private

  def job_params
    params.require(:job).permit(:description, :origin, :destination, :cost, :totalcontainers, :recontainers)

  end
end

class JobsController < ApplicationController
  
  def index
	@job = Job.new
  end

  def new
  	@job = Job.new
  end

  def create
  	
  end
end

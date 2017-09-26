class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find_by(id: params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(
      title: params[:job][:title],
      company: params[:job][:company],
      description: params[:job][:description]
    )

    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def edit
    @job = Job.find_by(id: params[:id])
  end

  def update
    @job = Job.find_by(id: params[:id])
    result = @job.update({
      title: params[:job][:title],
      company: params[:job][:company],
      description: params[:job][:description],
      })
    if result
      redirect_to job_path(@job.id)
    else
      render :edit
    end
  end

  def delete
    job = Job.find_by(id: params[:id])
    if job.destroy
      redirect_to jobs_path
    else  
    end
  end
end

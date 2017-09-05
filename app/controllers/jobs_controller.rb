class JobsController < ApplicationController

  def index
    if params[:sort] == 'location'
      @sorted_jobs = Job.sort_by_location
      render :sorted
    elsif params[:sort] == 'interest'
      @sorted_jobs = Job.sort_by_interest
      render :sorted
    elsif params[:location]
      @jobs = Job.filter_by_location(params[:location])
      render :filtered
    else
      @jobs = Job.all
    end
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
    @comment = Comment.new
    @comment.job_id = @job.id
  end

  def edit
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    @job.update(job_params)

    redirect_to company_job_path(@company, @job)
  end

  def destroy
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    @job.destroy

    flash[:success] = "#{@company.name} job deleted."

    redirect_to @company
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end
end

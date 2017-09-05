class CommentsController < ApplicationController

  def create
    @job = Job.find(params[:job_id])
    @company = @job.company
    @comment = @job.comments.create(comment_params)

    @comment.save

    redirect_to company_job_path(@company, @job)
  end


  private

  def comment_params
    params.require(:comment).permit(:content, :job_id)
  end

end

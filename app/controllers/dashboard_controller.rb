class DashboardController < ApplicationController

  def index
    @count_of_location = Job.location_sort_hash
    @top_3 = Job.level_of_interest_company
    @job_interest = Job.level_of_interest_job
  end

end

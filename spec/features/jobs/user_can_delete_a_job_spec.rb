require 'rails_helper'

RSpec.feature "User can delete a job" do
  scenario "user deletes a job from specific job show page" do
    company = create(:company)
    job = create(:job)

    visit company_job_path(company, job)

    click_on "Delete Job"

    expect(page).to_not have_content job.title
  end
end

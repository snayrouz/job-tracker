require 'rails_helper'

describe "User sees all jobs" do
  xscenario "a user sees all the jobs for a specific company" do
    company = create(:company)
    job = create(:job)
    job_2 = create(:job)

    visit company_path(company)

    expect(page).to have_content company.name
    expect(page).to have_content job.title
    expect(page).to have_content job_2.title
  end
end

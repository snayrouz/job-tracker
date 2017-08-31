require 'rails_helper'

RSpec.feature "User edits an existing job" do
  scenario "a user can edit an existing job" do
    company = create(:company)
    job = create(:job)

    visit company_job_path(company, job)

    click_on "Edit Job"
    fill_in "job[title]", with: "Bus Driver"
    click_on "Update Job"

    expect(page).to have_content("Bus Driver")
  end
end

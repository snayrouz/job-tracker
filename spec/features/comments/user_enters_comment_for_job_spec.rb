require 'rails_helper'

RSpec.feature "User views a job" do
  scenario "and they enter a comment for that job" do
    company = create(:company)
    job = create(:job)
    body = "This job does not feel like the one for me."
    body_2 = "Actually this job is great for the family."

    visit company_job_path(company, job)
    fill_in "comment[content]", with: body
    click_on "Create Comment"

    fill_in "comment[content]", with: body_2
    click_on "Create Comment"

    expect(page).to have_content body
    expect(page).to have_content body_2
    expect(body_2).to appear_before(body)
  end
end

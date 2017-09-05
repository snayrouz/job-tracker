require 'rails_helper'

RSpec.feature "User edits an existing job" do
  scenario "a user updates a job" do
    job = create(:job)
        visit("/companies/#{job.company.id}/jobs/#{job.id}")
        click_button "Edit Job"
        fill_in "job_title", with: "Jr Engineer"
        fill_in "job_level_of_interest", with: "77"
        click_on "Update Job"

        expect(page).to have_content("Jr Engineer")
        expect(page).to have_content("Level of Interest: 77")
        expect(page).to have_content(job.description)
        expect(page).to_not have_content("Level of Interest: 100")
        expect(current_path).to eq("/companies/#{job.company.id}/jobs/#{job.id}")

  end
end

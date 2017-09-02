require 'rails_helper'

describe "User creates a new job" do
  xscenario "and they see the new job" do
    company = create(:company)
    job = create(:job)
    category = create_list(:category, 4).last

    visit new_company_job_path(company)

    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"
    select category.title, from: 'job[category_id]'

    click_button "Create Job"

    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content(company.name)
    expect(page).to have_content(job.title)
    expect(page).to have_content(job.level_of_interest)
    expect(page).to have_content(job.city)
    expect(page).to have_content(category.title)
  end
end

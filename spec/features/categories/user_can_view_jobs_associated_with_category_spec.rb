require 'rails_helper'

RSpec.feature "User sees all jobs" do
  scenario "they see jobs associated to a category" do
    category = create(:category)
    job_1, job_2 = create_list(:job, 2, category: category)

    visit category_path(category)

    expect(page).to have_content category.title
    expect(page).to have_content job_1.title
    expect(page).to have_content job_2.title
  end
end

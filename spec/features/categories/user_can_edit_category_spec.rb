require 'rails_helper'

RSpec.feature "User sees all categories" do
  scenario "they edit an existing category" do
    category = create(:category)

    visit categories_path

    click_on "Edit"
    fill_in "category[title]", with: "Healthcare"
    click_on "Update category"

    expect(page).to have_content category.title
  end
end

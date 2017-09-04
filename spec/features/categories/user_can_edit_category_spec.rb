require 'rails_helper'

RSpec.feature "User sees all categories" do
  scenario "they edit an existing category" do
    category = create(:category)

    visit categories_path

    click_button "Edit"
    fill_in "category[title]", with: "Healthcare"
    click_on "Update Category"

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("Healthcare")
  end
end

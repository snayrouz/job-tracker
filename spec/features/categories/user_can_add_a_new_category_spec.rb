require 'rails_helper'

RSpec.feature "User can create a category" do
  scenario "they create a category through a form" do
    visit new_category_path

    fill_in "category[title]", with: "Web Development"
    click_on "Create"

    expect(current_path).to eq('/categories/1')
    expect(page).to have_content("Web Development")
  end


end

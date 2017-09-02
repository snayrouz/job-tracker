require 'rails_helper'

RSpec.feature "User can delete a category" do
  scenario 'they delete a category from the index page' do
    category = create(:category)

    visit categories_path
    click_on "Delete"

    expect(page).to_not have_content category
  end
end

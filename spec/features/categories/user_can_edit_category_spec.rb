require 'rails_helper'

RSpec.feature "User sees all categories" do
  scenario "they edit an existing category" do
    category = create(:category, :with_jobs)
        title_1 = category.title

        visit category_path(category)

        expect(page).to have_content title_1

        visit edit_category_path(category)

        fill_in 'category_title', with: 'Title 2'
        click_on 'Update Category'

        expect(page).to have_content 'Title 2'
        expect(page).to_not have_content title_1
  end
end

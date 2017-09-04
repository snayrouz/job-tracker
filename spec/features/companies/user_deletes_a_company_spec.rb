require 'rails_helper'

describe "User deletes existing company" do
  scenario "a user can delete a company" do
    company = Company.create(name: "ESPN")
    visit companies_path

    click_button "Delete"

    expect(page).to have_content("ESPN was successfully deleted!")
    expect(page).to_not have_content company
  end
end

require "rails_helper"

feature "Items" do

  scenario "Visitor can add menu item" do
    visit '/'
    click_on "New Menu Item"
    fill_in "Name", with: "TestName"
    fill_in "Description", with: "TestDescription"
    fill_in "Price", with: "1000"
    check('In stock')
    click_on "Create Item"
    expect(page).to have_content("TestName")
    expect(page).to have_content("TestDescription")
    expect(page).to have_content("1000")
    expect(page).to have_content("true")
  end

end

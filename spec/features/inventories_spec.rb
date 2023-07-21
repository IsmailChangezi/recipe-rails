require 'rails_helper'

RSpec.describe Inventory, type: :feature do
    before :each do
        @user = User.create(
            name: "testuser",
            email: "user@test.com",
            password: "testtest"
        )
        visit "/users/sign_in"
        fill_in "Email", with: "user@test.com"
        fill_in "Password", with: "testtest"
        click_button "Log in"
    end

    scenario "user can create a new inventory" do
        visit "/inventories/new"
        fill_in "Name", with: "Test Inventory"
        click_button "Create Inventory"
        expect(page).to have_content("Test Inventory")
    end

    scenario "user can edit a inventory" do
        visit "/inventories/new"
        fill_in "Name", with: "Test Inventory"
        click_button "Create Inventory"
        click_link "Edit"
        fill_in "Name", with: "Edited Inventory"
        click_button "Update Inventory"
        expect(page).to have_content("Edited Inventory")
    end

    scenario "user can delete a inventory" do
        visit "/inventories/new"
        fill_in "Name", with: "Test Inventory"
        click_button "Create Inventory"
        click_button "Destroy"
        expect(page).to have_content("Inventory was successfully destroyed.")
    end
end

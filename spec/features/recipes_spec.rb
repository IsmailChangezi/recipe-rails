require 'rails_helper'

RSpec.describe Recipe, type: :feature do
  before :each do
    @user = User.create(
      name: 'testuser',
      email: 'user@test.com',
      password: 'testtest'
    )
    @recipe = Recipe.create(
      name: 'Test Recipe'
    )
    visit '/users/sign_in'
    fill_in 'Email', with: 'user@test.com'
    fill_in 'Password', with: 'testtest'
    click_button 'Log in'
  end

  scenario 'user can create a new recipe' do
    visit '/recipes/new'
    fill_in 'Name', with: 'Test Recipe'
    click_button 'Create Recipe'
    expect(page).to have_content('Test Recipe')
  end

  scenario 'user can edit a recipe' do
    visit '/recipes/new'
    fill_in 'Name', with: 'Test Recipe'
    click_button 'Create Recipe'
    click_link 'Edit'
    fill_in 'Name', with: 'Edited Recipe'
    click_button 'Update Recipe'
    expect(page).to have_content('Edited Recipe')
  end

  scenario 'user can delete a recipe' do
    visit '/recipes/new'
    fill_in 'Name', with: 'Test Recipe'
    click_button 'Create Recipe'
    click_button 'Destroy'
    expect(page).to have_content('Recipe was successfully destroyed.')
  end
end

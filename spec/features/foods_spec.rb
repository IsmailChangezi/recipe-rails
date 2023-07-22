require 'rails_helper'

RSpec.describe Food, type: :feature do
  before :each do
    @user = User.create(
      name: 'testuser',
      email: 'user@test.com',
      password: 'testtest'
    )
    @food = Food.create(
      name: 'Test Food'
    )
    visit '/users/sign_in'
    fill_in 'Email', with: 'user@test.com'
    fill_in 'Password', with: 'testtest'
    click_button 'Log in'
  end

  scenario 'user can create a new food' do
    visit '/foods/new'
    fill_in 'Name', with: 'Test Food'
    click_button 'Create Food'
    expect(page).to have_content('Test Food')
  end

  scenario 'user can edit a food' do
    visit '/foods/new'
    fill_in 'Name', with: 'Test Food'
    click_button 'Create Food'
    click_link 'Edit'
    fill_in 'Name', with: 'Edited Food'
    click_button 'Update Food'
    expect(page).to have_content('Edited Food')
  end

  scenario 'user can delete a food' do
    visit '/foods/new'
    fill_in 'Name', with: 'Test Food'
    fill_in 'Measurement unit', with: 'Test Unit'
    fill_in 'Price', with: '1.00'
    click_button 'Create Food'
    click_button 'Delete'
    expect(page).to have_content('Food was successfully destroyed.')
  end
end

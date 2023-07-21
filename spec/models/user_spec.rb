require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should save a new user' do
      @user = User.new(
        name: 'Test User',
        email: 'user@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(@user).to be_valid
    end

    it 'should not save a new user if password and password_confirmation do not match' do
      @user = User.new(
        name: 'Test User',
        email: 'user@test.com',
        password: 'password',
        password_confirmation: 'password1'
      )
      expect(@user).to_not be_valid
    end
  end
end

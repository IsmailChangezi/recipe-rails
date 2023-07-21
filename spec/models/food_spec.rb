require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'Validations' do
    it 'should not save a new food if name is blank' do
      @food = Food.new(
        name: ''
      )
      expect(@food).to_not be_valid
    end
  end
end

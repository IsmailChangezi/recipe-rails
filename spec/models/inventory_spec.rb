require 'rails_helper'

RSpec.describe Inventory, type: :model do
  describe 'Validations' do
    it 'should not save a new inventory if name is blank' do
      @inventory = Inventory.new(
        name: '',
        user_id: 1
      )
      expect(@inventory).to_not be_valid
    end

    it 'should not save a new inventory if user_id is blank' do
      @inventory = Inventory.new(
        name: 'Test Inventory',
        user_id: ''
      )
      expect(@inventory).to_not be_valid
    end
  end
end

class RenameUsersIdToUserIdInInventories < ActiveRecord::Migration[7.0]
  def change
    rename_column :inventories, :users_id, :user_id
  end  
end

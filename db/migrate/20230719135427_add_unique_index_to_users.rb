class AddUniqueIndexToUsers < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :name, unique: true, name: 'index_users_on_name'
  end
end

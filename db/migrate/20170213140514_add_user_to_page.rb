class AddUserToPage < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :user_id, :integer
    add_index :pages, :user_id
  end
end

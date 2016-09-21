class AddColumnToChatroom < ActiveRecord::Migration[5.0]
  def change
    add_column :chatrooms, :current_user_id, :integer
    add_column :chatrooms, :user_id, :integer
  end
end

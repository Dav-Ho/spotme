class ReplaceAttributesOnChatroom < ActiveRecord::Migration[5.0]
  def change
    remove_column :chatrooms, :current_user_id, :integer
    remove_column :chatrooms, :user_id, :integer
    add_column :chatrooms, :user_1_id, :integer
    add_column :chatrooms, :user_2_id, :integer
  end
end

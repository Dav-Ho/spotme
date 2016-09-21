class ChangeColumnForChatroom < ActiveRecord::Migration[5.0]
  def change
    rename_column :chatrooms, :user_id, :topic
  end
end

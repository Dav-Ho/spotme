class RenameMessagesColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :messages, :sender_id, :user_id
    rename_column :messages, :recipient_id, :chatroom_id
  end
end

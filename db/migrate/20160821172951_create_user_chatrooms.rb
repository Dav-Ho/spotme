class CreateUserChatrooms < ActiveRecord::Migration[5.0]
  def change
    create_table :user_chatrooms do |t|
      t.string :user_id
      t.string :chat_room_id

      t.timestamps
    end
  end
end

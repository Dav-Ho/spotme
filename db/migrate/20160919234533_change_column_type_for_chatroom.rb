class ChangeColumnTypeForChatroom < ActiveRecord::Migration[5.0]
  def change
    change_column :chatrooms, :topic, :string
  end
end

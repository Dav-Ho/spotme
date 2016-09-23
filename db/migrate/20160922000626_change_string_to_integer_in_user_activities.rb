class ChangeStringToIntegerInUserActivities < ActiveRecord::Migration[5.0]
  def change
    remove_column :user_activities, :user_id, :string
    remove_column :user_activities, :activity_id, :string
    add_column :user_activities, :user_id, :integer
    add_column :user_activities, :activity_id, :integer
  end
end

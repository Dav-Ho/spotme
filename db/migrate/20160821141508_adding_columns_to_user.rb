class AddingColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_name, :string
    add_column :users, :country, :string
    add_column :users, :zip_code, :integer
    add_column :users, :admin, :boolean, default:false  
  end
end

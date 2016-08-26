class AddColumnsToDeviseUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :partner_gender, :string
    add_column :users, :image, :string
    add_column :users, :age, :integer
    add_column :users, :user_exp, :string
    add_column :users, :gym, :string
    add_column :users, :bio, :text
    remove_column :users, :country, :string
    add_column :users, :relationship_status, :string
  end
end

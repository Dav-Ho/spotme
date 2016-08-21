class CreateUserProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :user_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :partner_gender
      t.string :image
      t.string :age
      t.string :relationship_status
      t.string :user_exp
      t.string :gym
      t.text   :bio 

      t.timestamps
    end
  end
end

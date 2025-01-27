class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email
      t.text :bio
      t.string :avatar

      t.timestamps
    end
  end
end

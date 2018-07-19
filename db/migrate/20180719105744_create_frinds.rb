class CreateFrinds < ActiveRecord::Migration[5.2]
  def change
    create_table :frinds do |t|
      t.integer :user_id
      t.integer :friend_id
      t.boolean :accepted

      t.timestamps
    end
  end
end

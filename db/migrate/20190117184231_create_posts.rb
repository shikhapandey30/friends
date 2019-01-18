class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.text :topic
      t.text :post_text
      t.string :attachment
      t.string :visibility
      t.datetime :expiration_date

      t.timestamps
    end
  end
end

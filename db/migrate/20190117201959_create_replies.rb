class CreateReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :replies do |t|
      t.bigint :comment_id
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end

class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :upvotes, null: false, default: 0
      t.integer :downvotes, null: false, default: 0
      t.boolean :is_bloggable, null: false, default: false
      t.timestamps
    end
  end
end

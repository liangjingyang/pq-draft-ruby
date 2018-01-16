class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.integer :box_id
      t.text :content
      t.jsonb :images
      t.boolean :mini_program
      t.integer :parent_id
      t.datetime :last_shared_at
      t.integer :children_count

      t.timestamps
    end
  end
end

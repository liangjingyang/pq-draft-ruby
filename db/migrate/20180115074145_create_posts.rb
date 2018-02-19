class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.integer :box_id
      t.integer :user_id
      t.text :content
      t.jsonb :images
      t.boolean :mini_program, default: false
      t.integer :parent_id
      t.integer :parent_box_id
      t.string :parent_box_name
      t.datetime :last_shared_at
      t.datetime :last_copied_at
      t.datetime :last_pasted_at
      t.integer :copied_count, default: 0, null: false

      t.timestamps
    end
  end
end

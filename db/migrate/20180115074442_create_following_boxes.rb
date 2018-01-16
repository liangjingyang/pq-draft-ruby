class CreateFollowingBoxes < ActiveRecord::Migration[5.1]
  def change
    create_table :following_boxes do |t|
      t.integer :user_id
      t.integer :box_id

      t.timestamps
    end
  end
end

class CreateBoxFollowers < ActiveRecord::Migration[5.1]
  def change
    create_table :box_followers do |t|
      t.integer :user_id
      t.integer :box_id
      t.boolean :allowed, default: true, null: false

      t.timestamps
    end
  end
end

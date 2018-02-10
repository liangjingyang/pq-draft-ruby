class CreateBoxes < ActiveRecord::Migration[5.1]
  def change
    create_table :boxes do |t|
      t.integer :user_id
      t.string :image
      t.string :name
      t.string :number
      t.string :qrcode_token

      t.timestamps
    end
  end
end

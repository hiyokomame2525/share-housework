class CreateHouseworks < ActiveRecord::Migration[7.0]
  def change
    create_table :houseworks do |t|
      t.boolean :laundry,null: false , default: false
      t.boolean :dishes, null: false , default: false
      t.boolean :cooking ,null: false , default: false
      t.boolean :clean_room, null: false  , default: false
      t.boolean :bathroom, null: false , default: false
      t.boolean :trash, null: false , default: false
      t.boolean :toilet, null: false, default: false
      t.references :pair, null: false, foreign_key: true
      t.timestamps
    end
  end
end
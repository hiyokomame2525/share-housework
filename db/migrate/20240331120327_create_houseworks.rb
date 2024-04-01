class CreateHouseworks < ActiveRecord::Migration[7.0]
  def change
    create_table :houseworks do |t|
      t.boolean :laundry,null: false 
      t.boolean :dishes, null: false 
      t.boolean :cooking ,null: false 
      t.boolean :clean_room, null: false  
      t.boolean :bathroom, null: false 
      t.boolean :trash, null: false  
      t.boolean :toilet, null: false  
      t.date :date, null: false 
      t.references :user, null: false, foreign_key: true
      t.timestamps 
    end
  end
end

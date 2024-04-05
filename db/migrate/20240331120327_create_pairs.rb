class CreatePairs < ActiveRecord::Migration[7.0]
  def change
    create_table :pairs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :partner, null: false, foreign_key: {to_table: :users}
      t.timestamps

      t.index [:user_id, :partner_id], unique: true
    end
  end
end
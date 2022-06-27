class CreateItemSelects < ActiveRecord::Migration[6.0]
  def change
    create_table :item_selects do |t|
      t.integer :tops_item_id, null: false
      t.references :adviser, null: false, foreign_key: true
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end

class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.references :users, null: false, foreign_key: true
      t.references :advisers, null: false, foreign_key: true
      t.timestamps
    end
  end
end

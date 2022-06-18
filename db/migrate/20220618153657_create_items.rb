class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      # t.integer :preference_id, null: false
      t.timestamps
    end
  end
end

class CreateTopsItems < ActiveRecord::Migration[6.0]
  def change
    create_table :tops_items do |t|
      t.references :user, null: false, foreign_key: true
      #t.integer :preference_id
      t.timestamps
    end
  end
end

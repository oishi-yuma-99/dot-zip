class CreateTagRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_relationships do |t|
      t.integer :user_id, null: false
      t.integer :tag_id, null: false

      t.timestamps
    end
  end
end

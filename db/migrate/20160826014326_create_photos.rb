class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
        t.text :caption
        t.string :picture

        t.integer :layout_id
        t.integer :user_id
        t.timestamps
    end
    add_index :photos, [:user_id, :layout_id]
    add_index :photos, :layout_id
  end
end

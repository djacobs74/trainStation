class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
        t.text :message

        t.integer :user_id
        t.integer :layout_id
        t.timestamps
    end

    add_index :comments, [:user_id, :layout_id]
    add_index :comments, :layout_id
  end
end

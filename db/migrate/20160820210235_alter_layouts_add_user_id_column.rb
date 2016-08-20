class AlterLayoutsAddUserIdColumn < ActiveRecord::Migration
  def change
    add_column :layouts, :user_id, :integer
    add_index :layouts, :user_id
  end
end

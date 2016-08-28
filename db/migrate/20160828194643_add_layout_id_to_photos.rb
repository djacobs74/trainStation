class AddLayoutIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :layout_id, :integer
  end
end

class AddCategoryToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :category, :text
  end
end

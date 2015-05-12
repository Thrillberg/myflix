class ChangeCategoryColumnToCategoryId < ActiveRecord::Migration
  def change
    remove_column :videos, :category, :integer
    add_column :videos, :category_id, :integer
  end
end

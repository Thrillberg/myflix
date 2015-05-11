class ChangeCategoryColumnToInteger < ActiveRecord::Migration
  def change
    remove_column :videos, :category, :text
    add_column :videos, :category, :integer
  end
end

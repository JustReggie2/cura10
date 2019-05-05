class AddColumnCategoryIdToLists < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :category_id, :integer
  end
end

class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :products, :categories, :category_ids
    rename_column :products, :subsubcategories, :subsubcategory_ids
    rename_column :products, :subcategories, :subcategory_ids
  end
end

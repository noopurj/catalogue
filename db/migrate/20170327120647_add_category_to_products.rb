class AddCategoryToProducts < ActiveRecord::Migration
  def change
    add_column :products, :categories, :text
    add_column :products, :subcategories, :text
    add_column :products, :subsubcategories, :text
  end
end

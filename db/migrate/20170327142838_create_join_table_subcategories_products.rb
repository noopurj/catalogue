class CreateJoinTableSubcategoriesProducts < ActiveRecord::Migration
  def change
    create_join_table :subcategories, :products do |t|
      # t.index [:subcategory_id, :product_id]
      # t.index [:product_id, :subcategory_id]
    end
  end
end

class CreateJoinTableSubsubcategoriesProducts < ActiveRecord::Migration
  def change
    create_join_table :subsubcategories, :products do |t|
      # t.index [:subsubcategory_id, :product_id]
      # t.index [:product_id, :subsubcategory_id]
    end
  end
end

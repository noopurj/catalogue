class AddSubCategoryToSubsubCategory < ActiveRecord::Migration
  def change
    add_reference :subsubcategories, :subcategory, index: true, foreign_key: true
  end
end

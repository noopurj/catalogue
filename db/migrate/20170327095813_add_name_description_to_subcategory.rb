class AddNameDescriptionToSubcategory < ActiveRecord::Migration
  def change
    add_column :subcategories, :name, :string
    add_column :subcategories, :description, :text
  end
end

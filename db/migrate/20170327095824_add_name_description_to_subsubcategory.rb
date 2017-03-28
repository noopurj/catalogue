class AddNameDescriptionToSubsubcategory < ActiveRecord::Migration
  def change
    add_column :subsubcategories, :name, :string
    add_column :subsubcategories, :description, :text
  end
end

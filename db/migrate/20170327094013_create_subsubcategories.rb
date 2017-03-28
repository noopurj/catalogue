class CreateSubsubcategories < ActiveRecord::Migration
  def change
    create_table :subsubcategories do |t|

      t.timestamps null: false
    end
  end
end

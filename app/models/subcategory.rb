class Subcategory < ActiveRecord::Base
  has_many :subsubcategories, ->{uniq}
  belongs_to :category
  has_and_belongs_to_many :products, ->{uniq}
end

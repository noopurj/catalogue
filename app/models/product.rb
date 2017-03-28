class Product < ActiveRecord::Base
  has_and_belongs_to_many :categories, ->{uniq}
  has_and_belongs_to_many :subcategories, ->{uniq}
  has_and_belongs_to_many :subsubcategories, ->{uniq}
end

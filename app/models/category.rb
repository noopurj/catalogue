class Category < ActiveRecord::Base
  has_many :subcategories, ->{uniq}
  has_and_belongs_to_many :products, ->{uniq}
end

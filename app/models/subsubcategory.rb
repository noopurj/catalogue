class Subsubcategory < ActiveRecord::Base
  belongs_to :subcategory
  has_and_belongs_to_many :products, ->{uniq}
end

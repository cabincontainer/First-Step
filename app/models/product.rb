class Product < ActiveRecord::Base
	attr_accessible :name, :code, :specifications, :category_id, :best_seller, :price
  belongs_to :category
  has_many :photos, as: :attachable
end

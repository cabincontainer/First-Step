class Product < ActiveRecord::Base
	attr_accessible :name, :code, :specifications, :category_id, :best_seller

    validates :name, uniqueness: true
    validates :name, presence: true
    validates :code, uniqueness: true

	  belongs_to :category
    has_many :photos, as: :attachable
end

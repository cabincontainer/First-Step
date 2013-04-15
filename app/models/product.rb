class Product < ActiveRecord::Base
	attr_accessible :name, :code, :specifications, :category_id

    validates :name, uniqueness: true
    validates :name, presence: true
    validates :code, uniqueness: true

	  belongs_to :category
    has_many :photos, as: :attachable

  	serialize :specifications, Hash
end

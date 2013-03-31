class Product < ActiveRecord::Base
	attr_accessible :name, :code, :specifications

    validates :name, uniqueness: true
    validates :name, presence: true
    validates :code, uniqueness: true

	belongs_to :category
  	serialize :specifications, Hash
end
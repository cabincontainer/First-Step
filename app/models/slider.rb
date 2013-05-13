class Slider < ActiveRecord::Base
  attr_accessible :name, :active
  has_many :photos, as: :attachable
end

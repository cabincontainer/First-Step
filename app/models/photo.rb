class Photo < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true

  has_attached_file :attached_file, :styles => { :medium => "600x600", :thumb => "300x300>" }

  attr_accessor :attached_file_content_type
  attr_accessor :attached_file_file_size
  attr_accessor :attached_file_updated_at

  attr_accessible :attached_file, :attached_file_file_name
end

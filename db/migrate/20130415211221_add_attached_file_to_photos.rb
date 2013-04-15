class AddAttachedFileToPhotos < ActiveRecord::Migration
  def self.up
    add_attachment :photos, :attached_file
  end

  def self.down
    remove_attachment :photos, :attached_file
  end
end

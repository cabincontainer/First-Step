class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string      :name
      t.integer     :attachable_id
      t.string      :attachable_type
      t.boolean     :deleted,            :default => false
      t.timestamps
    end
  end
end

class CreateSliders < ActiveRecord::Migration
  def change
    create_table :sliders do |t|
      t.string      :name
      t.integer     :attachable_id
      t.string      :attachable_type
      t.timestamps
    end
  end

end

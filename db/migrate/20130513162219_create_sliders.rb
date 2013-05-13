class CreateSliders < ActiveRecord::Migration
  def change
    create_table :sliders do |t|
      t.string      :name
      t.boolean     :active, default: false
      t.timestamps
    end
  end

end

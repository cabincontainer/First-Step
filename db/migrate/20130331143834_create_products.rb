class CreateProducts < ActiveRecord::Migration
  def change
  	create_table :products do |t|
      t.string    	:name,               :null => false
      t.string		:code
      t.text		:specifications
      t.integer		:category_id
      t.timestamps
    end
  end
end

class AddPriceToProducts < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.integer :price, default: 0
    end
  end
end

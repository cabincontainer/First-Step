class AddBestSellerToProducts < ActiveRecord::Migration
  def change
  	change_table :products do |t|
  		t.boolean	:best_seller,	default: false
  	end
  end
end

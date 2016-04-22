class HomesController < ApplicationController
	skip_filter :require_user

	def index
    	@random_products = Product.limit(8).order("RAND()")
	end

  def coming_soon; end
end

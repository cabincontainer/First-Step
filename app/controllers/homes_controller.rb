class HomesController < ApplicationController
	skip_filter :require_user

	def index
    	@recomments = Product.where(best_seller: true)
	end

  def coming_soon; end
end

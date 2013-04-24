class HomesController < ApplicationController
	skip_filter :require_user

	def index
    	@recomments = Product.limit(3)
	end

  def coming_soon; end
end

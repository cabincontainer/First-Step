class HomesController < ApplicationController
	skip_filter :require_user

	def index
    @random_products = Product.order("created_at ASC").limit(8)
	end

  def coming_soon; end
end

class HomesController < ApplicationController
	skip_filter :require_user

	before_filter :load_slider_image_size, only: :index

	def load_slider_image_size
		if request.user_agent =~ /iPad/
			@image_size = :original
		elsif request.user_agent =~ /Mobile|webOS/
			@image_size = :medium
		else
			@image_size = :original
		end
	end

	def index
    @random_products = Product.order("created_at DESC").limit(8)
	end

  def coming_soon; end
end

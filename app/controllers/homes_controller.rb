class HomesController < ApplicationController
	skip_filter :require_user

	def index
		@categories = Category.all

    @recomments = Product.limit(3)
	end
end

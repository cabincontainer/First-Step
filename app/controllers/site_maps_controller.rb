class SiteMapsController < ApplicationController
	skip_filter :require_user

	def index
		@categories = Category.all
	end
end
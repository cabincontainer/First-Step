class ProductsController < ApplicationController
	skip_filter :require_user

	def index
	end

	def show
	end

	def show_porducts
		@category = Category.find(params[:id])
	end
end
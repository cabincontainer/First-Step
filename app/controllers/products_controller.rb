class ProductsController < ApplicationController
	skip_filter :require_user

	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
	end

	def show_porducts
		@category = Category.find(params[:id])
	end
end
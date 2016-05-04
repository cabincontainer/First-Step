class ProductsController < ApplicationController
	skip_filter :require_user

	def index
		@products = Product.order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
	end

	def show
		@product = Product.find(params[:id])
		@category = @product.category
		@random_products = @category.products.where("id <> ?", @product.id).limit(8).order("RAND()")
	end

	def show_porducts
		@category = Category.find(params[:id])
	end
end
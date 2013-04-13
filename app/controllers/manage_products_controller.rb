class ManageProductsController < ApplicationController

  before_filter :load_categories, only: [:new, :create, :edit, :update]

  def load_categories
    @categories = Category.all.map(&:name)
  end

	def index
    @products = Product.all
	end

	def new
		@product = Product.new
	end

  def create
    @product = Product.new(params[:product])
    @product.specifications = params[:specifications]

    if @product.save
      flash[:notice] = "Create product successfully."
      redirect_to manage_products_path
    else
      flash.now[:error] ||= []
      flash[:error] << "#{@product.errors.full_messages.join(", ")}"
      render(action: "new")
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end

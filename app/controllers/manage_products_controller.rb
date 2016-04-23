class ManageProductsController < ApplicationController

  before_filter :load_categories_name, only: [:new, :edit]

  def load_categories_name
    @categories_name = Category.all.map(&:name)
  end

	def index
    @products = Product.all
	end

	def new
		@product = Product.new
	end

  def create
    @product = Product.new(params[:product])
    if params[:product][:best_seller].present?
      @product.best_seller = true
    else
      @product.best_seller = false
    end

    category = Category.where(name: params[:category_name]).first
    @product.category = category if category.present?

    if @product.save
      if params[:photos].present?
        params[:photos].each do |photo_params|
          photo = Photo.new(photo_params)
          photo.attachable = @product
          photo.save
        end
      end

      flash[:notice] = "Create product successfully."
      redirect_to manage_products_path
    else
      flash.now[:error] ||= []
      flash[:error] << "#{@product.errors.full_messages.join(", ")}"
      render(action: "new")
    end
  end

  def show
    @product = Product.includes(:category, :photos).find(params[:id])
  end

  def edit
    @product = Product.includes(:category, :photos).find(params[:id])
  end

  def update
    @product = Product.includes(:photos).find(params[:id])
    @product.assign_attributes(params[:product])
    if params[:product][:best_seller].present?
      @product.best_seller = true
    else
      @product.best_seller = false
    end
    category = Category.where(name: params[:category_name]).first
    @product.category = category if category.present?

    if @product.save

      if params[:current_photos].present?
        @product.photos.where("id NOT IN (?)", params[:current_photos]).destroy_all
      else
        @product.photos.destroy_all
      end

      if params[:photos].present?
        params[:photos].each do |photo_params|
          photo = Photo.new(photo_params)
          photo.attachable = @product
          photo.save
        end
      end

      flash[:notice] = "Update product successfully."
      redirect_to manage_products_path
    else
      flash.now[:error] ||= []
      flash[:error] << "#{@product.errors.full_messages.join(", ")}"
      render(action: "edit")
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    flash[:notice] = "Delete product successfully."

    redirect_to manage_products_path
  end
end

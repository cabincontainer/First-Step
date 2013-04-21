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
    @product.specifications = params[:specifications]

    category = Category.where(name: params[:category_name]).first
    @product.category = category if category.present?

    if @product.save
      @product.photos.where("id NOT IN (?)", params[:current_photos]).destroy_all

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

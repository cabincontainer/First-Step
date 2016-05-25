class ManageProductsController < ApplicationController

  before_filter :load_categories_name, only: [:new, :edit]

  def load_categories_name
    @categories_name = Category.all.map(&:name)
  end

	def index
    @products = Product.order("created_at DESC").paginate(:page => params[:page], :per_page => 15)
	end

	def new
		@product = Product.new
    @product.build_category
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
      flash[:notice] = "Create product successfully."
      redirect_to edit_photos_manage_product_path(@product)
    else
      flash.now[:error] ||= []
      flash[:error] << "#{@product.errors.full_messages.join(", ")}"
      render(action: "new")
    end
  end
  
  def edit
    @product = Product.includes(:category).find(params[:id])
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
      flash[:notice] = "Update product successfully."
      redirect_to manage_products_path
    else
      flash.now[:error] ||= []
      flash[:error] << "#{@product.errors.full_messages.join(", ")}"
      render(action: "edit")
    end
  end

  def edit_photos
    @product = Product.includes(:photos).find(params[:id])
  end

  def upload_photo
    @product = Product.find(params[:id])

    if params[:photo].present?
      photo = Photo.new(params[:photo])
      photo.attachable = @product
      photo.save
    end

    redirect_to edit_photos_manage_product_path(@product)
  end

  def delete_photo
    @product = Product.find(params[:id])

    @product.photos.find(params[:photo_id]).destroy

    redirect_to edit_photos_manage_product_path(@product)
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    flash[:notice] = "Delete product successfully."

    redirect_to manage_products_path
  end
end

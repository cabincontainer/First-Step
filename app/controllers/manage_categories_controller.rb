class ManageCategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    if params[:category].present?
      @category = Category.new(params[:category])

      if @category.save
        flash[:notice] = "Create category successfully."
      else
        flash.now[:error] ||= []
        flash[:error] << "#{@category.errors.full_messages.join(", ")}"
        render(action: "new")
      end
    end

    redirect_to manage_categories_path
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.present?
      @category.assign_attributes(params[:category])

      if @category.save
        flash[:notice] = "Update category successfully."
      else
        flash.now[:error] ||= []
        flash[:error] << "#{@category.errors.full_messages.join(", ")}"
        render(action: "edit")
      end
    end

    redirect_to manage_categories_path
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    flash[:notice] = "Delete category successfully."

    redirect_to manage_categories_path
  end
end

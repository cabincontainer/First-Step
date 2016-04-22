class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(params[:blog])

    if @blog.save
      redirect_to blog_path(@blog)
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.assign_attributes(params[:blog])

    if @blog.save
      redirect_to blog_path(@blog)
    end
  end

  def destroy
    @blog = Blog.find(params[:id])

    if @blog.destroy
      redirect_to blogs_path
    end
  end
end
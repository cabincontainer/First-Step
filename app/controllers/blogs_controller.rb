class BlogsController < ApplicationController
  skip_filter :require_user, only: [:index, :show]

  def index
    @blogs = Blog.order("created_at DESC")
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(params[:blog])

    if @blog.save
      redirect_to blogs_path
    end
  end

  def show
    @blog = Blog.find(params[:id])

    html = Nokogiri::HTML.fragment(@blog.body)
    @meta_image = "#{request.host_with_port}#{html.css('img').first['src']}"
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.assign_attributes(params[:blog])

    if @blog.save
      redirect_to blogs_path
    end
  end

  def destroy
    @blog = Blog.find(params[:id])

    if @blog.destroy
      redirect_to blogs_path
    end
  end
end
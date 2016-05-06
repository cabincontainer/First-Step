class BlogsController < ApplicationController
  skip_filter :require_user, only: [:index, :show]

  def index
    @blogs = Blog.order("created_at DESC").paginate(:page => params[:page], :per_page => 2)
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

    begin
      html = Nokogiri::HTML.fragment(@blog.body)
      @meta_image = html.css('img').first['src']
    rescue
      @meta_image = nil
    end
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
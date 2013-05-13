class SlidersController < ApplicationController
	def index
		@sliders = Slider.all
	end

  def new
    @slider = Slider.new
  end

	def create
    @slider = Slider.new(params[:slider])

    if @slider.save
      if params[:photos].present?
        params[:photos].each do |photo_params|
          photo = Photo.new(photo_params)
          photo.attachable = @slider
          photo.save
        end
      end

      flash[:notice] = "Create slider successfully."
      redirect_to sliders_path
    else
      flash.now[:error] ||= []
      flash[:error] << "#{@slider.errors.full_messages.join(", ")}"
      render(action: "new")
    end
  end

  def show
    @slider = Slider.includes(:photos).find(params[:id])
  end

  def edit
    @slider = Slider.includes(:photos).find(params[:id])
  end

  def update
    @slider = Slider.includes(:photos).find(params[:id])
    @slider.assign_attributes(params[:slider])

    if @slider.save

      if params[:current_photos].present?
        @slider.photos.where("id NOT IN (?)", params[:current_photos]).destroy_all
      else
        @slider.photos.destroy_all
      end

      if params[:photos].present?
        params[:photos].each do |photo_params|
          photo = Photo.new(photo_params)
          photo.attachable = @slider
          photo.save
        end
      end

      flash[:notice] = "Update slider successfully."
      redirect_to slider_path(@slider)
    else
      flash.now[:error] ||= []
      flash[:error] << "#{@slider.errors.full_messages.join(", ")}"
      render(action: "edit")
    end
  end

  def destroy
    slider = Slider.find(params[:id])
    slider.destroy
    flash[:notice] = "Delete slider successfully."

    redirect_to sliders_path
  end

  def active
    sliders = Slider.update_all(active: false)

    slider = Slider.find(params[:id])
    slider.active = true
    slider.save

    flash[:notice] = "Set slider active successfully."

    redirect_to sliders_path
  end
end

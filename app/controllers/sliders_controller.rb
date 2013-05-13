class SlidersController < ApplicationController
	def index
		@sliders = Slider.all
	end

	def new
	end

	def create
	end
end
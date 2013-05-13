class FaqsController < ApplicationController
	skip_filter :require_user

	def index
		@faqs = Faq.paginate(:page => params[:page], :per_page => 3)
	end
end
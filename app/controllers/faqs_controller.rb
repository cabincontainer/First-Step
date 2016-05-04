class FaqsController < ApplicationController
	skip_filter :require_user

	def index
		@faqs = Faq.all
	end
end
class ContactsController < ApplicationController
	skip_filter :require_user

	def index
	end

	def create
		Notifier.contact_message(params).deliver

	    flash[:notice] = "Send meassage successfully."
		redirect_to ("/")
	end
end
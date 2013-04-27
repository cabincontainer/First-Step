class CustomersController < ApplicationController
	skip_filter :require_user

	def index
	end
end
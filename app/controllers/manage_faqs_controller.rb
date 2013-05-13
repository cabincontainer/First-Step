class ManageFaqsController < ApplicationController
	def index
		@faqs = Faq.paginate(:page => params[:page], :per_page => 4)
	end

	def new
		@faq = Faq.new
	end

	def create
		@faq = Faq.new(params[:faq])
		@faq.save
		flash[:notice] = "Create faq successfully."
		redirect_to(manage_faqs_path)
	end

	def edit
		@faq = Faq.find(params[:id])
	end

	def update
		@faq = Faq.find(params[:id])
		@faq.assign_attributes(params[:faq])
		@faq.save
		flash[:notice] = "Update faq successfully."
		redirect_to(manage_faqs_path)
	end

	def destroy
		@faq = Faq.find(params[:id])
		@faq.destroy
		flash[:notice] = "Deleted faq successfully."
		redirect_to(manage_faqs_path)
	end
end
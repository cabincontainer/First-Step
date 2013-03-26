class User < ActiveRecord::Base
	acts_as_authentic

	
	# class OriginalPasswordValidator < ActiveModel::Validator
 #   		def validate(record)
 #   			return if record.original_password.blank? 
 #     		record.errors.add(:original_password, "is wrong") and return false unless record.original_password.present? && record.valid_password?(record.original_password)
 #   		end
 # 	end

 # 	validates_with OriginalPasswordValidator

	# attr_accessor :original_password
	attr_accessible :name, :email, :password, :password_confirmation

	# def deliver_password_reset_instructions
	# 	reset_perishable_token!
	#     Notifier.password_reset_instructions(self).deliver
	# end
end
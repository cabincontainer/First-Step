# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Cabincontainer::Application.initialize!

config.action_mailer.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
  :address  => "smtp.gmail.com",
  :port  => 25,
  :user_name  => "cabincontainer@gmail.com",
  :password  => "RadioActive",
  :authentication  => :login
}

config.action_mailer.raise_delivery_errors = true

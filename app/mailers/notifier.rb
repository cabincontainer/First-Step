class Notifier < ActionMailer::Base
  default_url_options[:host] = Rails.configuration.notifier_default_host
  default_url_options[:port] = Rails.configuration.notifier_default_port
  default from: Rails.configuration.notifier_from_field

  def contact_message(params)
    @params = params
    mail(
      to: "kkcontainer@hotmail.com",
      subject: "Website Contact"
    )
  end

  def password_reset_instructions(user)
    @user = user
    mail(
      to: user.email,
      subject: "Password Reset Instructions"
    )
  end
end

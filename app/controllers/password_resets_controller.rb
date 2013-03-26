class PasswordResetsController < ApplicationController
  skip_filter :require_user
  before_filter :find_user_by_perishable_token, only: [:edit, :update]
  # authorize_resource class: false

  def new
    destroy_session
  end

  def create
    user = User.find_by_email(params[:email])
    user && user.deliver_password_reset_instructions
    flash[:notice] = "Please check your email for a password reset instruction."
    redirect_to("/")
  end

  def edit; end

  def update
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      flash[:notice] = "Your password is reset."
      UserSession.create(@user)
      redirect_to("/")
      return
    else
      render action: "edit"
    end
  end

  private
  def find_user_by_perishable_token
    @user = User.find_by_perishable_token(params[:id])
    head(:forbidden) and return false if @user.blank?
    @current_ability = Ability.new(@user)
    true
  end
end

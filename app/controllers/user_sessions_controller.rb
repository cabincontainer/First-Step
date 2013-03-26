class UserSessionsController < ApplicationController
  skip_filter :require_user

  def new
    @user_session = UserSession.new
  end

  def create
    unless @user_session = UserSession.new(params[:user_session]) and @user_session.valid?
      message = "Login fail."
      redirect_to (:back)
      destroy_session  
      return      
    end  
      

    @user_session = UserSession.create(params[:user_session])
    message = "Login Successfully."
    redirect_back_or_default homes_path
  end

  def destroy
    destroy_session
    if request.xhr?
      head(:ok)
    else
      redirect_to("/")
    end
  end
end

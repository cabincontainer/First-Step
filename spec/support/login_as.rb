module LoginAs
  def login_as(user = FactoryGirl.create(:user))
    user_session = UserSession.create(email: user.email, password: user.password)
    controller.instance_variable_set("@current_user_session", user_session)
    controller.instance_variable_set("@current_ability", Ability.new(user))
    yield user, user_session
  ensure
    user_session = controller.instance_variable_get("@current_user_session")
    user_session && user_session.destroy
    controller.instance_variable_set("@current_user_session", nil)
    controller.instance_variable_set("@current_ability", nil)
  end
end
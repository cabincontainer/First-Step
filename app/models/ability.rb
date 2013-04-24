class Ability
  include CanCan::Ability

  def initialize(user = User.new)

  	# Anyone
  	can :manage, :password_reset
    can :manage, :session

    return unless user

    if user.admin?
      can    :manage,             :all
    end

  end
end

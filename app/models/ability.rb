class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    can :manage, :all if user.role == 'admin' 
    can :delete if user.role == 'moderator'
  end
end

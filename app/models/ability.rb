class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new

    if user.is_admin?
      can :manage, [Post, Tag]
      can :destroy, User
    else
      can :create, [Post, Comment]
      can [:update, :destroy], [Post, Comment] do |resource|
        resource.user == user
      end
      can :update, User do |current_user|
        current_user == user
      end
    end
    can :read, :all
  end
end

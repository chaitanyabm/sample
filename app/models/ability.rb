class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    if user.present?
      if user.has_role?(:admin)
        can :manage, :all
      else
        can :read, Post
        can :write, Post if user.has_role?(:ServiceProvider, Post)
        can :write, Post, :id => Post.with_role(:ServiceProvider, user).pluck(:id)
        can :create, Post if user.has_role?(:ServiceProvider, Post)
        can :create, Post, :id => Post.with_role(:ServiceProvider, user).pluck(:id)
        cannot :destroy, Post
      end
    end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :read, :all
    can [:create, :join, :quit], Project if user.id
    can :update, Project do |project|
      #todo 负责人也可以改
      project.user_id == user.id
    end
    can :manage, :all if user.admin?
  end
end

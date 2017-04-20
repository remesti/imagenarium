class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    can :update, User, { id: user.try(:id) }
    can :create, User

    if user

      if user.admin?
        can :manage, :cards
      end
    end

  end
end

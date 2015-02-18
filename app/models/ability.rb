class Ability
  include CanCan::Ability

  def initialize(user)
    user ||=User.new
    if user.role? :admin
      can :manage, :all
    else
      can :destroy, FoodItem
      can :read, Quantity
      can :read, Ingredient
      can :edit, Favourite
      can :read, FoodItem
      can :read, Recipe
      can :read, Nutrition
    end
  end

end

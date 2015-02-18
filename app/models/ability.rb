class Ability
  include CanCan::Ability

  def initialize(user)
    user ||=User.new
    if user.has_role? :admin
      can :manage, :all
    else
      can :destroy, FoodItem
      can :read, Quantity
      can :read, Ingredient
      can :edit, Favourite
      can :edit, FoodItem
      can :create, FoodItem
      can :read, FoodItem
      can :read, Recipe
      can :read, Nutrition
    end
  end

end

Rails.application.routes.draw do
  resources :food_items

  devise_for :users
  root to: "food_items#index"
end

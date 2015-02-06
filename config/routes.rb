Rails.application.routes.draw do
  resources :recipes

  resources :quantities

  resources :nutritions

  resources :ingredients

  resources :food_items

  devise_for :users
  root to: "food_items#index"
end

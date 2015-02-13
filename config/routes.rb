Rails.application.routes.draw do
  resources :favourites

  resources :recipes

  resources :quantities

  resources :nutritions

  resources :ingredients

  resources :food_items

  devise_for :users
  root to: "home#index"
end

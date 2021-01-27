Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :profiles, only: [:new, :update, :edit, :create]
  resources :items
end

Rails.application.routes.draw do
  devise_for :users

  root 'items#index'

  resources :users, only: [:show, :edit]
  resources :items, only: [:index, :show, :new, :create] do
    resources :categories, only: [:search]
  end
end

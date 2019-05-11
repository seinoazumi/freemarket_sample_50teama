Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get 'logout' => 'users#logout'
  end
  
  root 'items#index'

  resources :users, only: [:show]
  resources :items, only: [:index, :show, :new, :create] do
    resources :categories, only: [:search]
  end
end

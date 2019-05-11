Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    delete 'logout', to: 'devise/sessions#destroy'
  end
  
  root 'items#index'

  resources :users, only: [:show, :destroy]
  resources :items, only: [:index, :show, :new, :create] do
    resources :categories, only: [:search]
  end
end

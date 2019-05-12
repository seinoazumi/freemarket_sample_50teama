Rails.application.routes.draw do
  devise_for :users

  root 'items#index'
  get 'logout' => 'users#logout'


  resources :users, only: [:show, :edit]
  resources :items, only: [:index, :show, :new, :create] do
    resources :categories, only: [:search]
  end
end

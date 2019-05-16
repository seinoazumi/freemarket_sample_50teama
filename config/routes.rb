Rails.application.routes.draw do
  devise_for :users, controllers: {
    :registrations => 'users/registrations'
  }

  root 'items#index'
  get 'logout' => 'users#logout'
  get 'edit' => 'users#edit'
  # ルーティングは追って検討する

  get 'users/signup/:url', controller: 'users', action: 'new'

  resources :users, only: [:show, :new]
  resources :items, only: [:index, :show, :new, :create] do
    resources :categories, only: [:search]
  end
  resources :cards, only: [:new]
end

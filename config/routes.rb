Rails.application.routes.draw do
  devise_for :users, controllers: {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  root 'items#index'
  get 'logout' => 'users#logout'
  get 'edit' => 'users#edit'
  get 'confirm' => 'items#confirm'
  # ルーティングは追って検討する

  resources :users, only: [:show, :new, :edit, :update] do
    collection do
      get 'signup/:url',action: 'new'
      get 'mypage/:url',action: 'edit'
    end
  end
  resources :items, only: [:index, :show, :new, :create] do
    resources :categories, only: [:search]
  end
  resources :cards, only: [:new, :show]
end

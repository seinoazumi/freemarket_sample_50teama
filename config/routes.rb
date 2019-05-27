Rails.application.routes.draw do
  devise_for :users, controllers: {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :omniauth_callbacks => 'users/omniauth_callbacks'
  }

  root 'items#index'
  get 'edit' => 'users#edit'

  resources :users, only: [:show, :new, :edit, :update] do
    resources :cards, only: [:index, :new] do
      member do
        get 'pay' #カード決済メソッド
        get 'card_delete'
        get 'card_new'
      end
    end
    collection do
      get 'signup/:url',action: 'new'
      get 'mypage/:url',action: 'edit'
    end
  end
#payをカードコントローラに移動。cards_controllerはモデルを持たない。

  resources :items, only: [:index, :show, :new, :create, :edit, :destroy, :update] do
    member do
      get 'confirm' #購入確認画面
    end
    collection do
      get 'search'
    end
    resources :categories, only: [:search]
  end
end

Rails.application.routes.draw do
  
  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root 'homes#top'
    resources :users, only: [:index, :edit, :update]
    resources :posts, only: [:show, :destroy]
    resources :tags, only: [:index, :destroy]
  end

  # ユーザー用
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  root 'public/homes#top'
  get "/search", to: "public/searches#search"
  get  '/users/check' => 'public/users#check'
  patch  '/users/withdraw' => 'public/users#withdraw'
  
  scope module: :public do
    resources :users, only: [:show, :edit, :update, :destroy], param: :account_name do
      resource :relationships, only: [:create, :destroy]
        get "followings" => "relationships#followings", as: "followings"
        get "followers" => "relationships#followers", as: "followers"
    end
    resources :posts, only: [:index, :show, :create, :destroy] do
      resource :favorite, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
    resources :accounts, only: [:edit, :update, :destroy], param: :account_name
  end
  
  # ゲストログイン用
  devise_scope :user do
    post "users/guest_sign_in", to: "public/sessions#guest_sign_in"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

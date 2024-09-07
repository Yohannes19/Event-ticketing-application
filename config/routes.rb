Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :events
    root to: 'dashboard#index'
  end

  #get 'pages/home'

  devise_for :users, controllers: {
     sessions: 'users/sessions'
     }


  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  unauthenticated do
    root 'pages#home'
  end

  authenticated :user do
    root 'events#index', as: :authenticated_root
  end
  
  resources :events do
    resources :tickets, only: [:index,:new, :create, :destroy]
  end
  resources :events do
    resources :tickets, only: [:new, :create]
  end
  resource :profile, only: [:show, :edit, :update]
end

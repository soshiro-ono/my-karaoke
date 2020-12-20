Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root to: 'songs#index'
  resources :relationships, only: [:create, :destroy]
  resources :users, only: [:show] do
    get :followings, on: :member
    member do
      get 'search'
    end
  end
  resources :songs do
    resources :favorites, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
end

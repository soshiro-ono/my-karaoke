Rails.application.routes.draw do
  # get 'users/show'
  devise_for :users
  root to: 'songs#index'
  resources :relationships, only: [:create, :destroy]
  resources :users, only: [:show] do
    get :followings, on: :member
    collection do
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

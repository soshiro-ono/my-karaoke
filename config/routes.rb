Rails.application.routes.draw do
  # get 'users/show'
  devise_for :users
  root to: 'songs#index'
  
  resources :users, only: [:show]
  resources :songs do
    resources :favorites, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
end

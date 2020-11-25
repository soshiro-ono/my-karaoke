Rails.application.routes.draw do
  devise_for :users
  root to: 'songs#index'
  resources :songs do
    collection do
      get 'search'
    end
  end
end

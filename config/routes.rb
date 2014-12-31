Rails.application.routes.draw do
  root "playlists#index"
  devise_for :users

  resources :playlists do
    resources :reviews, only: [:create]
  end
end

Rails.application.routes.draw do
  root "playlists#index"
  devise_for :users

  resources :playlists, only: [:new, :create, :show, :index] do
    resources :reviews, only: [:create]
  end
end

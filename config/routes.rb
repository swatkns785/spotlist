Rails.application.routes.draw do
  root "playlists#index"
  devise_for :users
  resources :users, only: [:show]

  resources :playlists do
    resources :reviews, only: [:create, :edit, :show, :update, :destroy]
  end
end

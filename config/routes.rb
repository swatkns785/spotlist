Rails.application.routes.draw do
  root 'playlists#index'
  devise_for :users

  resources :playlists, only: [:new, :create, :index, :show]

end

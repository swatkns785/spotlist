Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :playlists, only: [:new, :create, :show]

end

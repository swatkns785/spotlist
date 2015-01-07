Rails.application.routes.draw do
  root "playlists#index"
  devise_for :users
  resources :users, only: [:show]

  resources :playlists do
    resources :reviews, only: [:create, :edit, :show, :update, :destroy]
  end

  resources :reviews, only: [:show] do
    member do
      post "upvote", to: "votes#upvote"
      post "downvote", to: "votes#downvote"
    end
  end

  namespace :admin do
    resources :users, only: [:index, :destroy]
    resources :playlists, only: [:update, :destroy]
    resources :reviews, only: [:destroy]
  end
end

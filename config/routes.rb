Rails.application.routes.draw do
  devise_for :users

  get 'messages/index'
  # root to: "messages#index"
  root to: "prototypes#index"
  resources :users, only: [:index, :show]
  resources :prototypes, only: [:new, :create, :show, :edit, :update, :destroy] do
  resources :comments, only: :create

  end
end
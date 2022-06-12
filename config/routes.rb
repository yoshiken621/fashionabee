Rails.application.routes.draw do
  get 'messages/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  devise_for :advisers, controller:{
    sessions: 'advisers/sessions',
    passwords: 'advisers/passwords',
    registrations: 'advisers/registrations'
  }

  root to: "rooms#index"

  resources :users, only: [:edit, :update]
  resources :advisers, only: [:edit, :update]
  resources :room, only: [:new, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end
end

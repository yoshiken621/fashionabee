Rails.application.routes.draw do
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

  root to: "tops#index"

  resources :users, only: [:index, :edit, :update]
  resources :advisers, only: [:edit, :update]
  resources :item_selects, only: [:new, :create]
  resources :tops_items
  resources :rooms, only: [:new, :show, :create, :destroy] do
    resources :messages, only: [:create]
  end
end

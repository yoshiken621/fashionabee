Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'students/registrations'
  }

  devise_for :advisers, controller:{
    sessions: 'advisers/sessions',
    passwords: 'advisers/passwords',
    registrations: 'advisers/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

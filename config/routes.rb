Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#new'
  resources :users, only: [:new, :create]
  resources :sessions, only: [:create, :destroy]

  resources :days, only: [:index, :show, :create, :new, :update] do
    resources :votes, only: [:create]
    resources :pitches, only: [:create]
  end

  resources :pitches, only: [:create, :new] do
    resources :votes, only: [:create]
  end

  resources :admins, only: [:new, :create]
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#new'
  resources :users, only: [:new, :create]
  resources :sessions, only: [:create, :destroy]
  resources :days, only: [:index, :show] do
    member do
      resources :pitches, only: [:create]
    end
  end
  resources :pitches, only: [:new] do
    member do
      resources :votes, only: [:create]
    end
  end
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#new'
  resources :users, only: [:new, :create]
  resources :sessions, only: [:create, :destroy]

  resources :days, only: [:index, :show, :create, :new, :edit, :update] do
    resources :pitches, only: [:create]
  end
  resources :pitches, only: [:create] do
    resources :votes
  end
  # TODO restrict path once I get everything working
  resources :admins
end

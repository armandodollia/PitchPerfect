Rails.application.routes.draw do
  root 'days#index'
  resources :days, only: [:index]
end

Rails.application.routes.draw do
  devise_for :users
  root to: 'power_generators#index'
  resources :home, only: %i[index]
end

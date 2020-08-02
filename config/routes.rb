Rails.application.routes.draw do
  get 'match_equipment/index'
  devise_for :users
  root to: 'power_generators#index'
  # get 'power_generators#index'
  resources :power_generators, only: %i[index show]
  resources :home, only: %i[index]
end

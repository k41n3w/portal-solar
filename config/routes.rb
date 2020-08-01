Rails.application.routes.draw do
  get 'match_equipment/index'
  devise_for :users
  root to: 'power_generators#index'
  resources :home, only: %i[index]
end

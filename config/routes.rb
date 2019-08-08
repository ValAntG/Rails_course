Rails.application.routes.draw do
  get 'welcome/index'
  resources :trains
  resources :railway_stations
  resources :routes
  # resources :tickets

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

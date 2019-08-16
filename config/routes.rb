Rails.application.routes.draw do
  get 'welcome/index'
  resources :trains
  resources :railway_stations do
    patch :update_position, on: :member
  end
  resources :routes
  resources :carriages

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

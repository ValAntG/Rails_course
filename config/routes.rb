Rails.application.routes.draw do
  devise_for :admins
  get 'persons/profile', as: 'user_root'
  get 'home/index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'welcome/index'
  resources :trains do
    resources :carriages, shallow: true
  end
  resources :railway_stations do
    patch :update_position, on: :member
  end
  resources :routes
  resources :tickets
  resource :search, only: [:new, :show, :edit]

  root "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

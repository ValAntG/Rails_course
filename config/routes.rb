Rails.application.routes.draw do
  # devise_for :admins
  # get 'persons/profile', as: 'user_root'
  get 'home/index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :tickets, only: [:new, :create, :show, :index]
  resource :search, only: [:new, :show, :edit]

  namespace :admin do
    resources :trains do
      resources :carriages, shallow: true
    end
    resources :railway_stations
    resources :routes do
      patch :del_station, on: :member
      patch :add_station, on: :member
      patch :add_train, on: :member
    end
    resources :tickets
    get 'welcome/index'
  end

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users

  get 'welcome/index'
  root 'welcome#index'
  # root 'searches#new'

  namespace :admin do
    resources :tickets, except: %i[new]
    resources :trains do
      resources :wagons
      # STI required
      resources :sitting_wagons, controller: 'wagons', type: 'SittingWagon'
      resources :economy_wagon, controller: 'wagons', type: 'EconomyWagon'
      resources :sleeping_wagon, controller: 'wagons', type: 'SleepingWagon'
      resources :coupe_wagons, controller: 'wagons', type: 'CoupeWagon'
    end

    resources :railway_stations do
      patch :update_position, on: :member
    end

    resources :routes
    resources :tickets
  end

  resources :tickets

  # resolves search as singular resource
  resource :search, only: %i[new show]
  resolve('Search') { [:search] }
end

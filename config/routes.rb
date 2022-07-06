Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'

  resources :trains do
    resources :wagons
    # STI required
    resources :sitting_wagons, controller: 'wagons', type: 'SittingWagon'
    resources :economy_wagon, controller: 'wagons', type: 'EconomyWagon'
    resources :sleeping_wagon, controller: 'wagons', type: 'SleepingWagon'
    resources :coupe_wagons, controller: 'wagons', type: 'CoupeWagon'

    resources :tickets
  end

  resources :railway_stations do
    patch :update_position, on: :member
  end

  # resolves search as singular resource
  resource :search, only: %i[new show]
  resolve('Search') { [:search] }

  resources :routes
end

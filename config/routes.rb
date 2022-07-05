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
  end
  resources :railway_stations do
    patch :update_position, on: :member
  end
  resources :routes
end

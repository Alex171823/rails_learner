Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'

  resources :trains
  resources :railway_stations
  resources :routes

  resources :wagons
  resources :sitting_wagons, controller: 'wagons', type: 'SittingWagon'
  resources :economy_wagon, controller: 'wagons', type: 'EconomyWagon'
  resources :sleeping_wagon, controller: 'wagons', type: 'SleepingWagon'
  resources :coupe_wagons, controller: 'wagons', type: 'CoupeWagon'
end

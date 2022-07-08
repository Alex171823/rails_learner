Rails.application.routes.draw do
  resources :trains
  resources :railway_stations
  resources :routes
  resources :wagons
  resources :coupe_wagon, controller: 'wagons', type: 'CoupeWagon'
  resources :economy_wagon, controller: 'wagons', type: 'EconomyWagon'
  get 'welcome/index'

  # Defines the root path route ("/")
  # root "articles#index"
  root 'welcome#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end

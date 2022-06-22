Rails.application.routes.draw do
  resources :trains
  get 'welcome/index'

  resources :railway_stations

  # Defines the root path route ("/")
  # root "articles#index"
  root 'welcome#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end

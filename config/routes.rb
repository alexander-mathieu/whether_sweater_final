Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  namespace :api do
    namespace :v1 do
      get '/backgrounds', to: 'backgrounds#show'
      get '/forecast', to: 'forecasts#show'

      post '/road_trip', to: 'road_trips#create'
      post '/sessions', to: 'sessions#create'

      resources :users, only: :create
    end
  end
end

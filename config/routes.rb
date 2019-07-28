Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/backgrounds', to: 'backgrounds#show'
      get '/forecast', to: 'forecasts#show'

      post '/sessions', to: 'sessions#create'

      resources :users, only: :create
    end
  end
end

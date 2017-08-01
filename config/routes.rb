Rails.application.routes.draw do
  root to: 'stats#index'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :teams do
        get '/teams', to: 'teams#index'
        get '/teams/:id', to: 'teams#show'
      end
      namespace :players do
        get '/stats', to: 'stats#index'
        get '/stats/:id', to: 'stats#show'
      end
    end
  end
end

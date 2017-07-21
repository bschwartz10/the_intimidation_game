Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :teams do
        get '/teams', to: 'teams#index'
        get '/teams/:id', to: 'teams#show'
      end
      namespace :players do
        get '/stats/:id', to: 'stats#show'
      end
    end
  end
end

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :teams do
        get '/owned_team_players', to: 'owned_team_players#index'
        get '/comp_team_players/:id', to: 'comp_team_players#show'
      end
    end
  end
end

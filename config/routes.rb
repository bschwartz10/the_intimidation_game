Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :teams do
        get '/owned_team_players', to: 'owned_team_players#index'
        get '/comp_team_players/:id', to: 'comp_team_players#show'
        get '/comp_team', to: 'comp_team#index'
        get '/comp_team/:id', to: 'comp_team#show'
      end
      namespace :players do
        get '/player_stats/:id', to: 'player_stats#show'
      end
    end
  end
end

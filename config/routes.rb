Rails.application.routes.draw do
  post '/api/v1/login', to: 'api/v1/users#login'
  get 'api/v1/scores', to: 'api/v1/users#scores'
  post '/api/v1/users/jwt', to: 'api/v1/users#jwt'
  namespace :api do
    namespace :v1 do
      resources :users
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end

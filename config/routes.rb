Rails.application.routes.draw do
  post '/api/v1/login', to: 'api/v1/users#login'
  namespace :api do
    namespace :v1 do
      resources :users
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end

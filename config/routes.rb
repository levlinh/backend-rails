Rails.application.routes.draw do
  get '/current_user', to: 'current_user#index'
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    registration: 'signup',
    sign_out: 'logout'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations:'users/registrations'
  }

  namespace :api do
    namespace :v1 do
      resources :pokemons, :categories
    end
  end
end

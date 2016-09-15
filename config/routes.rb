Rails.application.routes.draw do
#  devise_for :users, path: 'users', path_names: { sign_in: 'login', sign_out: 'logout', password: 'password', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'signup' }
  devise_for :users

  get "/welcome" => "workouts#welcome"
  get "/workouts" => "workouts#index"
  get "/workouts/new" => "workouts#new"
  post "/workouts" => "workouts#create"
  get "/workouts/edit" => "workouts#edit"
  patch "/workouts" => "workouts#update"

  get "/matches" => "matches#index"
  get '/matches/:id' => "matches#show"
  get '/matches/:id/edit' => "matches#edit"
  patch "/matches/:id" => "matches#update"
  delete "/matches/:id" => "matches#destroy"
  
  post "/follow/:id" => 'follows#create'
  resources :users do
    member do
      get :following, :followers
    end
  end
  devise_scope :user do
    authenticated :user do
      root "matches#index", as: :authenticated_root
  end

    unauthenticated do
      root "workouts#welcome", as: :unauthenticated_root
    end
  end
end

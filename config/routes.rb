Rails.application.routes.draw do
#  devise_for :users, path: 'users', path_names: { sign_in: 'login', sign_out: 'logout', password: 'password', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'signup' }
devise_for :users

get "/welcome" => "welcome#index"

get "/workouts" => "workouts#index"
get "/workouts/new" => "workouts#new"
post "/workouts" => "workouts#create"
get "/workouts/edit" => "workouts#edit"
patch "/workouts" => "workouts#update"


devise_scope :user do
  authenticated :user do
    root "workouts#index", as: :authenticated_root
  end

  unauthenticated do
    root "welcome#index", as: :unauthenticated_root
  end
end

end

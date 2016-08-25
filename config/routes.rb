Rails.application.routes.draw do
#  devise_for :users, path: 'users', path_names: { sign_in: 'login', sign_out: 'logout', password: 'password', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'signup' }
devise_for :users

get "/workouts" => "workouts#index"
get "/workouts/new" => "workouts#new"
get "/workouts/edit" => "workouts#edit"
patch "/workouts" => "workouts#update"

devise_scope :user do
  authenticated :user do
    root "workouts#index", as: :authenticated_root
  end

  unauthenticated do
    root "devise/sessions#new", as: :unauthenticated_root
  end
end

end

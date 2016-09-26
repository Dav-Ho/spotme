Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}

  get '/welcome' => "workouts#welcome"
  get '/workouts' => "workouts#index"
  get '/workouts/new' => "workouts#new"
  post '/workouts' => "workouts#create"
  get '/workouts/edit' => "workouts#edit"
  patch '/workouts' => "workouts#update"

  get '/matches' => 'matches#index'
  get '/search' => 'matches#search'
  get '/matches/:id' => 'matches#show'
  get '/matches/:id/edit' => 'matches#edit'
  patch '/matches/:id' => 'matches#update'
  delete '/matches/:id' => 'matches#destroy'
  post '/follow/:id' => 'follows#create'

  namespace :api do
    namespace :v1 do
      get '/chatrooms/:id' => 'chatrooms#show'
      get '/messages' => 'messages#index'
      get '/messages/new' => 'messages#new'
      post '/messages' => 'messages#create'
    end
  end

  get '/chatrooms/new' => 'chatrooms#new'
  post '/chatrooms' => 'chatrooms#create'
  get '/chatrooms/:id' => 'chatrooms#show'

  mount ActionCable.server => '/cable'

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]

  devise_scope :user do
    authenticated :user do
      root "matches#index", as: :authenticated_root
    end
    unauthenticated :user do
      root "workouts#welcome", as: :unauthenticated_root
    end
  end

end

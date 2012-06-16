RailscastsChina::Application.routes.draw do
  root :to => "home#index"

  resources :users, :only => [ :show, :edit, :update ]
  post '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  post '/auth/failure' => 'sessions#failure'
end

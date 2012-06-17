RailscastsChina::Application.routes.draw do
  root :to => "episodes#index"

  resources :episodes

  resources :users, :only => [ :show, :edit, :update ]
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end

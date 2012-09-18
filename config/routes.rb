RailscastsChina::Application.routes.draw do
  root :to => "episodes#index"

  resources :comments
  resources :episodes do
    resources :comments
  end

  resources :users, only: [ :show, :edit, :update ]

  resources :tags, only: [] do
    resources :episodes, only: [:index]
  end

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', as: :signin
  get '/signout' => 'sessions#destroy', as: :signout
  get '/auth/failure' => 'sessions#failure'
end

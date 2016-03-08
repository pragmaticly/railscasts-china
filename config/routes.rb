Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :comments
  resources :episodes do
    resources :comments
  end

  resources :users, only: [:show, :edit, :update]
  resources :votes, only: [:create, :destroy]

  resources :tags, only: [] do
    resources :episodes, only: [:index]
  end

  root to: 'episodes#index'

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', as: :signin
  get '/signout' => 'sessions#destroy', as: :signout
  get '/auth/failure' => 'sessions#failure'
  get 'about' => 'info#about', as: :about
end

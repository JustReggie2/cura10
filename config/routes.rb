Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create'

  get 'lists/most_votes', to: 'lists#most_votes'
  get 'users/most_active', to: 'users#most_active'

  resources :lists do
    member { post :favorite, :up_vote, :down_vote }
  end


  resources :users, only: [:new, :create, :show] do
    resources :lists, only: [:new, :create, :show]
  end

  resources :category, only: [:index] do
    resources :lists, only: [:index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'lists#index'
end

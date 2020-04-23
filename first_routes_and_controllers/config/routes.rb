Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :destroy, :index, :show, :update]
  # get '/users', to: 'users#index', as: 'users'
  # post '/users', to: 'users#create'
  # get '/users/:id', to: 'users#show', as: 'user'
  # put '/users/:id', to: 'users#update'
  # patch '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'

  resources :artworks, only: [:create, :destroy, :index, :show, :update]
  # get '/artworks', to: 'artworks#index', as: 'users'
  # post '/artworks', to: 'artworks#create'
  # get '/artworks/:id', to: 'artworks#show', as: 'user'
  # put '/artworks/:id', to: 'artworks#update'
  # patch '/artworks/:id', to: 'artworks#update'
  # delete '/artworks/:id', to: 'artworks#destroy'
end

Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  get 'pets_up' => 'pets#new'
  get '/signup' => 'users#new'
  get '/home' => 'home#page'
  get '/grab_zip' => 'users#zip'


  root 'home#index'

  resources :users
  resources :pets
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get 'messages/index'

  get 'conversations/index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  get '/home' => 'home#page'
  get '/grab_zip' => 'users#zip'


  root 'home#index'

  resources :users do
    resources :pets
  end
  resources :conversations do
    resources :messages
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

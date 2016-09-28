Rails.application.routes.draw do

  get 'comments/index'

  get 'messages/index'

  get 'conversations/index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  get '/home' => 'home#page'
  get '/grab_zip' => 'users#zip'
  get '/like/:id' => 'posts#like'


  root 'home#index'

  resources :posts do
    resources :comments
    member do
      get 'like'
    end
  end
  resources :users do
    resources :pets
  end
  resources :conversations do
    resources :messages
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

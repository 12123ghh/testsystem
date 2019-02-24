Rails.application.routes.draw do
  root 'static_pages#home'
  #static_page route
  get '/help',   to: 'static_pages#help'
  get '/about',  to: 'static_pages#about'
  #user_page route
  get '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get '/login',   to:'sessions#new'
  post '/login',  to:'sessions#create'
  delete '/logout', to:'sessions#destroy'
  get '/edit', to:'users#edit'
  post '/edit',to:'users#update'
  get '/users' ,to:'users#index'

  resources :users
  resources :papers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

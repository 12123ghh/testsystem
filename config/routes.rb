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

  get '/newpaper' ,to:'papers#new'
  post '/newpaper',to:'papers#create'

  resources :users
  resources :papers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :admin_users
    resources :teachers do
      member do
        post :change_status
      end
    end
    resources :students do
      member do
        post :change_status
      end
    end
    resources :papers do
      member do
        get :review
        get :editreview
        post :updatereview
      end
    end
    resources :sessions
  end

  namespace :teacher do
    resources :teacher_users do
      member do
        get :edit_password 
        post :update_password
      end
    end
    resources :papers do 
      member do
        get :new_questions
        post :create_questions
      end
    end
    resources :sessions
  end
end

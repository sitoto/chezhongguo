Chezhongguo::Application.routes.draw do




  resources :autoparts

  resources :car_models

  get "answers/create"

  get "answers/destory"


  resources :questions do 
    resources :answers
     collection do
       get 'search'
       get 'tags'
       get 'experts'
       get 'unanswered'
       get 'my'
       get 'node'
     end
  end

  get "search/index"

  get "search/cars"

  if Rails.env.development? 
    match "/images/*path" => "gridfs#serve"
  end

  resources :cars do 
    resources :parameters
  end

  authenticated :user do
    root :to => 'home#index'
  end

  root :to => "home#index"

  devise_for :users
  resources :users, :only => [:show, :index]

  resources :brands, :only => [:show, :index]    

  resources :nodes

  match "questions/node:id" => "questions#node", :as => :node_questions



  #----------------------------------- admin -----------------------------------
  namespace :admin do
    root :to => "home#index"

    resources :makers 
    resources :car_models 
    resources :cars
    resources :nodes
    resources :users

    resources :questions do 
      resources :answers
    end
 
    resources :brands do
      resources :makers 
    end
  end
  #................................... admin ...................................

end

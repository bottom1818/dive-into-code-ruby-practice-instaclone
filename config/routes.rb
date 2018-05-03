Rails.application.routes.draw do
  # get 'favorites/create'

  # get 'favorites/destroy'

  get 'users/index'

  get 'users/show'
  
  resources :favorites, only: [:create, :destroy]

  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :users, :only => [:index, :show]
  
  get '/instaclone_contents', to: 'instaclone_contents#index'
  
  resources :instaclone_contents do
    collection do
      post :confirm
    end
  end
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  
  root :to => 'instaclone_contents#index'
  
  
end

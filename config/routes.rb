Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :recipes do
    resources :reviews
  end

  resources :posts
  resources :users

  resources :comments, only: :destroy
  resources :locations, only: %i[index show] do
    resources :comments, only: %i[create]
  end
  # Defines the root path route ("/")
  root 'pages#home'
end

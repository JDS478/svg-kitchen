Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :recipes do
    resources :reviews
  end

  resources :chatrooms do
    resources :messages, only: :create
  end

  resources :posts
  resources :users

  resources :foodplaces, only: %i[index show] do
    resources :placereviews, only: %i[new create edit update]
  end
  # Defines the root path route ("/")
  root 'pages#home'
end

Rails.application.routes.draw do
  resources :comments
  resources :posts
  resources :likes
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

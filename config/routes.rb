Rails.application.routes.draw do
  #get 'home/index' to make the home page the same as localhost 3000,did this:
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

Rails.application.routes.draw do
  # Defines all seven RESTful routes for the kittens resource
  resources :kittens

  # Sets the root path of the application to the kittens index page
  root 'kittens#index'
end

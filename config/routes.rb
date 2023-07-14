Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "tasks#index"   #So here we are defining the root path of our application to "tasks/index" and it shows "Hello. Rails"
  # If we dont do it then we will be getting the default localhost screen
  resources :tasks   # here we have a resource that takes care of all the routes of CRUD
end

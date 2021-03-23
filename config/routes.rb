Rails.application.routes.draw do
  get "todos", to: "todos#index"
  #get "todos", to: "todos#home"
  #get "todos", to: "todos#index"
  get "todos/:id", to:"todos#show"
  #post "users/login", to: "users#login"
  resources :todos
end



#routes.rb is the place where we define every URL that our application is supposed to handle.

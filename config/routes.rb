Rails.application.routes.draw do
  get "todos", to: "todos#index"
  get "todos/:id", to:"todos#show"
end



#routes.rb is the place where we define every URL that our application is supposed to handle.

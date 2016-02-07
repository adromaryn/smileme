Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: "users/confirmations",
    passwords:     "users/passwords",
    registrations: "users/registrations",
    sessions:      "users/sessions"
  }
  
  root 'users#me'
  
  get 'users/:id' => 'users#show', as: 'user'
  post '/users/login' => 'users#login'
  get '/about' => 'users#get_about'
  post '/users/about' => 'users#about'
end

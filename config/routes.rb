Rails.application.routes.draw do
  resources :posts
  devise_for :users, controllers: {
    confirmations: "users/confirmations",
    passwords:     "users/passwords",
    registrations: "users/registrations",
    sessions:      "users/sessions"
  }
  
  root 'users#me'
  
  get 'users/:id' => 'users#show', as: 'user'
end

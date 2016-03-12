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
  get 'users/:id/about' => 'users#get_about'
  post '/users/about' => 'users#about'
  post '/avatar' => 'users#avatar', as: 'avatar'
  
  post 'posts/new_pic' => 'posts#create_pic_post', as: 'new_pic_post'
  post 'posts/new_video' => 'posts#create_video_post', as: 'new_video_post'
  get 'posts/id:id' => 'posts#show', as: 'post'
  delete '/posts/id:id' => 'posts#destroy'
end

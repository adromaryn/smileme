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
  get 'users/:id/login' => 'users#get_login'
  post '/users/about' => 'users#about'
  post '/avatar' => 'users#avatar', as: 'avatar', defaults: { format: 'js' }
  post '/users/:id/follow' => 'users#follow'
  post '/users/:id/unfollow' => 'users#unfollow'
  
  post 'posts/new_pic' => 'posts#create_pic_post', as: 'new_pic_post', defaults: { format: 'js' }
  post 'posts/new_video' => 'posts#create_video_post', as: 'new_video_post', defaults: { format: 'js' }
  get 'posts/id:id' => 'posts#show', as: 'post'
  get 'feed' => 'posts#feed', as: 'feed'
  
  post 'posts/id:id' => 'comments#create', as: 'new_comment', defaults: { format: 'js'}
  delete '/comments/id:id' => 'comments#destroy', as: 'comments'
  
  get '/search/quick' => 'search#quick', as: 'qsearch'
  get '/search/' => 'search#index', as: 'search'
  
  
  get '/follows' => 'users#follows', as: 'follows'
end

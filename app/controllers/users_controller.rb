class UsersController < ApplicationController
  
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, :only => [:avatar]
  
  def show
    @user=User.find(params[:id])
    @posts = @user.posts.paginate(:page => params[:page]).order('created_at DESC')
  end
  
  def me
    redirect_to current_user
  end
  
  def login
    login = params[:login]
    if request.xhr?
    	login = "Anonimous" if  login.tr(" \n\t", '') == ""
    	current_user.login = login
      current_user.save
      respond_to do |format|
        format.js {render file: 'users/login'}
      end
     end
  end
  
  def get_login
    if request.xhr?
    	user = User.find(params[:id])
      render :json => {
        login: user.login
      }
    end
  end
  
  def get_about
    if request.xhr?
    	user = User.find(params[:id])
      render :json => {
        about: user.about
      }
    end
  end
  
  def about
    about = params[:about]
    if request.xhr?
    	about = "Silent Bob" if  about.tr(" \n\t", '') == ""
    	current_user.about = about
      current_user.save
      respond_to do |format|
        format.js {render file: 'users/about'}
      end
    end
  end
  
  def avatar
    current_user.avatar = params[:avatar]
    current_user.save
    @user = current_user
    respond_to do |format|
      format.js
    end
  end
  
  def follow
  	user = User(params[:id])
  	current_user.follow(user)
  end
  
  def follow
  	if request.xhr?
  		user = User.find(params[:id])
  	  current_user.follow(user)
  	  respond_to do |format|
        format.js { render nothing: true } 
      end
  	end
  end
  
  def unfollow
  	if request.xhr?
  	  user = User.find(params[:id])
  	  current_user.stop_following(user)
  	  respond_to do |format|
        format.js { render nothing: true } 
      end
  	end
  end
  
  def follows
    @follows = current_user.follows_by_type('User').paginate(page: params[:page], per_page: 10).order('created_at DESC')
  end
end

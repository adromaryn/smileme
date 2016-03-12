class UsersController < ApplicationController
  
  before_action :authenticate_user!
  
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
    	current_user.login = login
      current_user.save
      render :json => {
        login: current_user.login
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
      render :json => {
        about: current_user.about
      }
    end
  end
  
  def avatar
    current_user.update(avatar_param)
    redirect_to root_path
  end
  
  private
  def avatar_param
    params.require(:user).permit(:avatar)
  end
end

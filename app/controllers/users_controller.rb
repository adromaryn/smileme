class UsersController < ApplicationController
  
  before_action :authenticate_user!
  
  def show
    @user=User.find(params[:id])
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
      render :json => {
        about: current_user.about
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
end

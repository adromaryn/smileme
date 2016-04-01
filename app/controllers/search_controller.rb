class SearchController < ApplicationController
	
	def quick
	  if request.xhr?
	  	@users = User.quick_search(params[:search])
	  	@users = @users[0...3] if @users.length > 3
	  	@ids = @users.map{|user| user.id}
	  	get_login =-> (login){(login.length > 12) ? (login.slice(0,9) + '...'):login}
	  	@logins = @users.map{|user| get_login.call(user.login)}
	  	@avatars = @users.map{|user| user.avatar.url(:thumb)}
		  render :json => {
		  	ids: @ids,
			  users: @logins,
			  avatars: @avatars
      }
	  end
  end
  
  def index
  	login, about = params[:login]||"", params[:about]||""
  	@users = User.search(login,about).paginate(:page => params[:page]).order('created_at DESC')
  end
	
end


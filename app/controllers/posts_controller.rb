class PostsController < ApplicationController
  
  def create_pic_post
  	@post = Post.new
  	@post.user = current_user
    @pic_post = PicPost.new( pic_post_params)
    @user = current_user
    @posts = current_user.posts.paginate(:page => params[:page]).order('created_at DESC')
    if @pic_post.valid?
    	@post.save
      @pic_post.post = @post
      @pic_post.save
    else
    	if @pic_post.title.length < 1 || @pic_post.title.length > 200
    		flash.now[:post_error] = "The title cannot be fill or longer then 200 chars"
    	else
    		flash.now[:post_error] = "You should attach a picture to the post"
    	end
    end
    respond_to do |format|
      format.js {render file: '/posts/create_post.js.erb'}
    end
  end
  
  def create_video_post
  	@post = Post.new
  	@post.user = current_user
    @video_post = VideoPost.new(video_post_params)
    @user = current_user
    @posts = current_user.posts.paginate(:page => params[:page]).order('created_at DESC')
    if @video_post.valid?
    	@post.save
      @video_post.post = @post
      @video_post.save
    else
    	if @video_post.title.length < 1 || @video_post.title.length > 200
    		flash.now[:post_error] = "The title cannot be fill or longer then 200 chars"
    	else
    		flash.now[:post_error] = "You should attach a youtube or vimeo video to the post"
    	end
    end
    respond_to do |format|
      format.js {render file: '/posts/create_post.js.erb'}
    end
  end

  def destroy
  	@post = Post.find(params[:id])
    if @post.user == current_user
    	if @post.pic_post
    		@post.pic_post.destroy
    	end
    	if @post.video_post
    		@post.video_post.destroy
    	end
      @post.destroy
      if request.xhr?
      	render :json => {}
      else
      	respond_to do |format|
          format.html { redirect_to current_user, notice: 'Post was successfully destroyed.' }
        end
      end
    else
    	if request.xhr?
      	render :json => {}
      else
    	  redirect_to root_path
    	end
    end
  end
  
  def show
  	@post = Post.find(params[:id])
  	@comments = @post.comments.paginate(:page => params[:page]).order('created_at DESC')
  	@comment = Comment.new
  end
  
  def feed
    follows = current_user.all_follows
    posts = nil
    follows.each do |follow|
    	user = User.find(follow.followable_id)
    	if posts
    		posts = posts.union(Post.where(user_id: user.id))
      else
      	posts = Post.where(user_id: user.id)
      end
    end
    user = User.find(follows.first.followable_id)
  	@posts = posts.paginate(:page => params[:page]).order('created_at DESC')
  end
  
  def like
  	@post = Post.find(params[:id])
  	if current_user.voted_up_on? @post
  		@post.unliked_by current_user
  	else
  	  @post.liked_by current_user
  	end
  	respond_to do |format|
      format.js {render file: '/posts/likes.js.erb'}
    end
  end
  
  def dislike
  	@post = Post.find(params[:id])
  	if current_user.voted_down_on? @post
  		@post.undisliked_by current_user
  	else
  	  @post.disliked_by current_user
  	end
  	respond_to do |format|
      format.js {render file: '/posts/likes.js.erb'}
    end
  end

  private

  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.

  def pic_post_params
    params.require(:pic_post).permit(:title, :image, :definition).to_h
  end
  
  def video_post_params
    params.require(:video_post).permit(:title, :link, :definition).to_h
  end
end

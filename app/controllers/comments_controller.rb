class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    post = Post.find(params[:id])
    @comment.post = post
    @comment.user = current_user
    @comment.save
    @comments = post.comments.paginate(:page => params[:page]).order('created_at DESC')
    respond_to do |format|
      format.js {render file: '/comments/create_comment.js.erb'}
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user == current_user
      @comment.destroy
      if request.xhr?
      	render :json => {}
      else
      	respond_to do |format|
          format.html { redirect_to @comment.post, notice: 'Comment was successfully destroyed.' }
        end
      end
    else
    	if request.xhr?
      	render :json => {}
      else
    	  redirect_to @comment.post
    	end
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:text)
  end
  
end

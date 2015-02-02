class CommentsController < ApplicationController
  
  def new
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = Comment.new
  end

 def create
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    if @comment.save
      flash[:notice] = "Comment was saved"
      redirect_to [@topic,@post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render :new
    end
 end

def destroy
   @comment = Comment.find(params[:id])
   @post = Post.find(params[:post_id])
   @topic = @post.topic
   authorize @comment

  if @comment.destroy
   flash[:notice] = "Comment was deleted successfully."
   redirect_to [@topic,@post]
  else
   flash[:error] = "There was an error deleting the comment."
   render :show
  end
end

private

def comment_params
  params.require(:comment).permit(:body)
end

end

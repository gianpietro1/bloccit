class FavoritesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: @post)
    authorize favorite

    if favorite.save
      flash[:notice] = "You have favorited this post"
      redirect_to [@post.topic,@post]
    else
      flash[:error] = "There was an error favorting the post. Please try again."
      redirect_to [@post.topic,@post]
    end 
  end

def destroy
   @post = Post.find(params[:post_id])
   favorite = current_user.favorites.find(params[:id])
   authorize favorite

  if favorite.destroy
   flash[:notice] = "You have unfavorited the post."
   redirect_to [@post.topic,@post]
  else
   flash[:error] = "There was an error unfavoriting the post."
   redirect_to [@post.topic,@post]
  end
end

end

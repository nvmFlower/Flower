class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def about
    @post = Post.first
    @author = User.find_by id: @post.user_id
  end

  def show
    @post = Post.find_by id: params[:id]
    @author = User.find_by id: @post.user_id
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :img)
  end
end

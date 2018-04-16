class CommentsController < ApplicationController
  def create
    product_id = params[:com][:product_id]
    user_id = params[:user]
    @comment = Comment.create(comment_params)
    redirect_to product_path(product_id)

  end
  private
  def comment_params
    params.require(:com).permit(:content, :product_id, :user_id)
  end
end

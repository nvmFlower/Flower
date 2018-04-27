class CommentsController < ApplicationController

  def create
    product_id = params[:com][:product_id]
    user_id = params[:user]
    if logged_in?
      @comment = current_user.comments.build(comment_params)
      if @comment.save
        respond_to do |format|
          format.html
          format.js
        end
      else
        redirect_to root_url
      end
    else
      flash[:danger] = "Login please"
    end
  end

  private
  def comment_params
    params.require(:com).permit(:content, :product_id, :user_id)
  end
end

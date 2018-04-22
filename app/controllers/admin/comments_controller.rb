class Admin::CommentsController < Admin::ApplicationController
  def index
    @comments = Comment.all.order(created_at: :desc)
  end
  def destroy
    @comment = Comment.find_by id: params[:id]
    if @comment.destroy
      flash[:success] = "Xoa thanh cong"
      redirect_to admin_comments_url
    else
      flash[:success] = "Xoa khong thanh thanh cong"
      redirect_to admin_comments_url
    end
  end
end

class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = "コメントが送信されました"
      redirect_to item_path(params[:item_id])
    else
      flash.now[:alert] = "コメントを入力してください" 
      @item = Item.find(params[:item_id])
      @comments = @item.comments.includes(:user)
      render "items/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end

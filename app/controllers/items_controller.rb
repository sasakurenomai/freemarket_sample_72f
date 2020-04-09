class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def show
    @item = Item.find(params[:id])
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def edit
  end

  def destroy
  end
end

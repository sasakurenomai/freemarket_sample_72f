class ItemsController < ApplicationController
  def index
    @item = Item.find(1)
    @users = User.page(params[:page]).per(5)
  end

  def new
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def destroy
  end
end

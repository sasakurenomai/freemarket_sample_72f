class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]

  def index
    @item = Item.find(1)
    @users = User.page(params[:page]).per(5)
  end

  def new
  end
  
  def show
  end
  
  def edit
  end
  
  def destroy
    if @item.destroy
      render :destroy
    else
      redirect_to :back, alert: '商品の出品取り下げ時にエラーが発生しました。'
    end
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end
end

class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]

  def index
    @item = Item.find(1)
    @image = @item.item_image
  end

  def new
  end
  
  def show
    @item = Item.find(params[:id])
    @image = @item.item_image
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
    @item = Item.find(1)
  end
end

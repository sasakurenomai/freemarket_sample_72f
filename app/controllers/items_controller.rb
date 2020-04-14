class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_item, only: [:show, :destroy]

  def index
    @items = Item.all.includes(:item_images)
    @users = User.page(params[:page]).per(5)
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @item = Item.new
    @item.item_images.new
  end

  def show
    @item = Item.find(params[:id])
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
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

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :details, :price, item_images_attributes: [:image_url, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

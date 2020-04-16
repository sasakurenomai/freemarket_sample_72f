class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_item, except: [:index, :new, :create, :get_category_children, :get_category_grandchildren]

  def index
    @items = Item.all.includes(:item_images)
    @parents = Category.where(ancestry: nil).order('id ASC')
  end

  def new
    @item = Item.new
    @item.item_images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  
  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
    @category_grandchildren = Category.find(@item.category_id)
    @category_children = @category_grandchildren.parent
    @category_parent = @category_children.parent

    @item_status = ItemStatus.find(@item.item_status_id)
    @charge = Charge.find(@item.charge_id)
    @shipping_area = ShippingArea.find(@item.shipping_area_id)
    @shipping_days = ShippingDays.find(@item.shipping_days_id)

    # 商品画像
    @itemPics = @item.item_images.where(item_id: @item.id)
  end
  
  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      render :destroy
    else
      redirect_to :back, alert: '商品の出品取り下げ時にエラーが発生しました。'
    end
  end

  def get_category_children
    @category_children = Category.find_by(id: "#{params[:parent_id]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  private
  def item_params
    params.require(:item).permit(:name, :details, :price, :item_status_id, :shipping_area_id, :shipping_days_id, :category_id,:charge_id, :brand, item_images_attributes: [:image_url, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
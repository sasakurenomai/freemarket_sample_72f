class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_item, except: [:top, :index, :new, :create, :get_category_children, :get_category_grandchildren]

  def top
    @items = Item.all.includes(:item_images)
  end

  def index
    @items = Item.all.includes(:item_images)
    @users = User.page(params[:page]).per(5)
    @parents = Category.where(ancestry: nil).order('id ASC').limit(13)
  end

  def new
    @item = Item.new
    @items = Item.all.includes(:item_images)
    @item.item_images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path
      # flash[:notice] = "入力できていない必須項目があります"
      # redirect_back(fallback_location: new_item_path)
    end
  end

  
  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
    @category_grandchildren = Category.find(@item.category_id)
    @category_children = @category_grandchildren.parent
    @category_parent = @category_children.parent
    @itemPics = @item.item_images.where(item_id: @item.id)

    @item_status = ItemStatus.find(@item.item_status_id)
    @charge = Charge.find(@item.charge_id)
    @shipping_area = ShippingArea.find(@item.shipping_area_id)
    @shipping_days = ShippingDays.find(@item.shipping_days_id)
  end
  
  def edit
    @category_grandchildren = @item.category
    @category_children = @category_grandchildren.parent
    @category_parent = @category_children.parent

    @itemPics = @item.item_images.where(item_id: @item.id)
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
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
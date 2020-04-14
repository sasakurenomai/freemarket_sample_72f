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

    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
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
    @item = Item.find(params[:id])
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end
  
  def edit
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
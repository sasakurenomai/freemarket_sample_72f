class ItemsController < ApplicationController
  def index
  end

  def create
    @item = Item.new(product_params)
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

  private
  def product_params
    params.require(:item).permit(:name, :details, :price, item_images_attributes: [:image_url])
  end
end
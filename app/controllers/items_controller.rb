class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def show
    @item = Item.find(params[:id])
    @seller = User.find(@item.users_items.find_by(item_id: @item.id).seller_id)
  end
end

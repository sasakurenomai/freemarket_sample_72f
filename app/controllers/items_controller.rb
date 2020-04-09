class ItemsController < ApplicationController
  def index
  end

  def new
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  def edit
  end
  
  def destroy
    item = Item.find(params[:id])
    item.destroy
    render("items/destroy")
  end
end

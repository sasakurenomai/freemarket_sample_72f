class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]

  def index
  end

  def new
  end
  
  def show
  end
  
  def edit
  end
  
  def destroy
    @item.destroy
    render("items/destroy")
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end
end

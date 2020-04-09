class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    render("items/destroy")
  end
end

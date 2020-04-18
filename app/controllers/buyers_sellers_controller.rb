class BuyersSellersController < ApplicationController
  def show
  #製品のbuyer_idを付与
    @item_buyer= Product.find(params[:id])
    @item_buyer.update( buyer_id: current_user.id)
    redirect_to root_path
  end
end

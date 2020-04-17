class PurchaseController < ApplicationController
require 'payjp'
  
  def index
    @card = Card.where(user_id: current_user.id).first

    if @card.blank?
      redirect_to controller: "card", action: "new"
    else
      @item = Item.find(1)
      @image = @item.item_image
      Payjp.api_key = "#{Rails.application.credentials.PAYJP_PRIVATE_KEY}"
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end
  
  def pay
    @item = Item.find(params[:id])
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = "#{Rails.application.credentials.PAYJP_PRIVATE_KEY}"
    Payjp::Charge.create(
    :amount => @item.price,
    :customer => card.customer_id, 
    :currency => 'jpy',
    )
    
    @item.update_attribute(:buyer_id, current_user.id)
    redirect_to action: 'done'
  end

  def done
    @item = Item.find(params[:id])
    @image = @item.item_image
    @buyer = @item.buyer_id
    
  end

end

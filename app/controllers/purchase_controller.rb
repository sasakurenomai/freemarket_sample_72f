class PurchaseController < ApplicationController
  require 'payjp'
  before_action :set_card, only:[:index, :pay]
  before_action :set_item, only:[:pay, :done]

  def index

    if @card.blank?
      redirect_to controller: "card", action: "new"
    else
      @item = Item.find(1)  #index内のeachループによる商品画像一覧展開が未実装の為、item.(1)を仮置き
      @image = @item.item_image
      Payjp.api_key = "#{Rails.application.credentials.PAYJP_PRIVATE_KEY}"
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end
  
  def pay
    Payjp.api_key = "#{Rails.application.credentials.PAYJP_PRIVATE_KEY}"
    Payjp::Charge.create(
     amount: @item.price,
     customer: @card.customer_id, 
     currency: 'jpy',
    )
    
    @item.update_attribute(:buyer_id, current_user.id)
    redirect_to action: 'done'
  end

  def done
    @image = @item.item_image
    @buyer = @item.buyer_id
  end

  private
    def set_card
      @card = Card.where(user_id: current_user.id).first
    end

    def set_item
      @item = Item.find(params[:item_id])
    end
end

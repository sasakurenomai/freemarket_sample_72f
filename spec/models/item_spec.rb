require 'rails_helper'
describe Item do
  describe '#create' do

    it "nameがない場合は出品できないこと" do
      item = Item.new()
      item.valid?
      expect(item.errors.messages[:name]).to include("を入力してください")
    end

    it "detailsがない場合は出品できないこと" do
      item = build(:item, details: "")
      item.valid?
      expect(item.errors[:details]).to include("を入力してください")
    end

    it "priceがない場合は出品できないこと" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it "user_idがない場合は出品できないこと" do
      item = build(:item, user_id: "")
      item.valid?
      expect(item.errors[:user_id]).to include("を入力してください")
    end

    it "item_status_idがない場合は出品できないこと" do
      item = build(:item, item_status_id: "")
      item.valid?
      expect(item.errors[:item_status_id]).to include("を入力してください")
    end

    it "shipping_area_idがない場合は出品できないこと" do
      item = build(:item, shipping_area_id: "")
      item.valid?
      expect(item.errors[:shipping_area_id]).to include("を入力してください")
    end

    it "shipping_days_idがない場合は出品できないこと" do
      item = build(:item, shipping_days_id: "")
      item.valid?
      expect(item.errors[:shipping_days_id]).to include("を入力してください")
    end
  end

  describe '#edit' do

    it "nameがない場合は出品できないこと" do
      item = Item.new()
      item.valid?
      expect(item.errors.messages[:name]).to include("を入力してください")
    end

    it "detailsがない場合は出品できないこと" do
      item = build(:item, details: "")
      item.valid?
      expect(item.errors[:details]).to include("を入力してください")
    end

    it "priceがない場合は出品できないこと" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

  end
end
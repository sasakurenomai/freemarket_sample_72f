require 'rails_helper'
describe Item do
  describe '#update' do

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
require 'rails_helper'

describe PurchaseController, type: :controller do
  describe 'GET #index' do
    it "index.html.hamlに遷移するか(メソッドを除いた遷移テスト)" do
      get 'index'
      expect(response).to render_template :index
    end
  end

  describe 'GET #done' do
    it "done.html.hamlに遷移するか(メソッドを除いた遷移テスト)" do
      get 'done'
      expect(response).to render_template :done
    end
  end

end
require 'rails_helper'

describe CardController, type: :controller do
  describe 'GET #new' do
    it "new.html.hamlに遷移するか(メソッドを除いた遷移テスト)" do
      get 'new'
      expect(response).to render_template :new
    end
  end

  describe 'GET #index' do
    it "index.html.hamlに遷移するか(メソッドを除いた遷移テスト)" do
      get 'index'
      expect(response).to render_template :index
    end
  end

  #describe 'テスト該当アクション' do
    #it 'テスト内容'do
      #model = create(:model)
      #get :action, params: {id: model} idを持たせる場合
      #expect 検証 (respond レスポンスビュー).to render_template :action
    #end

    #it 'テスト内容' do
    #model = create(:model)  
    #HTTPmethod :action, params{id: model}
    #expect 検証(assigns(:model)).to eq model
    
    #end
  #end

end
require 'rails_helper'

describe User do
  describe '#create' do
    it " nicknameがない場合は登録できないこと " do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it " emailがない場合は登録できないこと " do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it " passwordがない場合は登録できないこと " do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it " passwordが存在してもpassword_confirmationがない場合は登録できないこと " do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it " passwordが7文字以上の英数字であれば登録できること " do
      user = build(:user, password: "ww00000", password_confirmation: "ww00000")
      user.valid?
      expect(user).to be_valid
    end

    it " passwordが7文字以上でも英字が含まれていないと登録できない " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user).to be_valid
    end

    it " passwordが6文字以下であれば登録できないこと " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end

    it " 本人情報 名前(性)がない場合は登録できないこと " do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it " 本人情報 名前(名)がない場合は登録できないこと " do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it " 本人情報 名前フリガナ(性)がない場合は登録できないこと " do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    it " 本人情報 名前フリガナ(名)がない場合は登録できないこと " do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end

    it " 生年月日がない場合は登録できないこと" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end

    it " 重複したemailが存在する場合は登録できないこと " do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

  end
end